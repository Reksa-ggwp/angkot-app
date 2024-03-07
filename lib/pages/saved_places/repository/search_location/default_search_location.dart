import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:trufi/models/trufi_latlng.dart';
import 'package:trufi/models/trufi_place.dart';
import 'package:trufi/pages/home/services/exception/fetch_online_exception.dart';
import 'package:trufi/pages/saved_places/repository/search_location/location_search_storage.dart';
import 'package:trufi/utils/packge_info_platform.dart';
import 'package:trufi/utils/trufi_app_id.dart';
import '../search_location_repository.dart';

class DefaultSearchLocation implements SearchLocationRepository {
  final LocationSearchStorage storage = LocationSearchStorage();
  final String photonUrl;
  final Map<String, dynamic>? queryParameters;

  DefaultSearchLocation(
    String searchAssetPath, {
    required this.photonUrl,
    this.queryParameters = const {},
  }) {
    storage.load(searchAssetPath);
  }

  @override
  Future<List<TrufiPlace>> fetchLocations(
    String query, {
    int limit = 15,
    String? correlationId,
    String? lang = "es",
  }) async {
    final extraQueryParameters = queryParameters ?? {};
    final Uri request = Uri.parse(
      "$photonUrl/api",
    ).replace(queryParameters: {
      "q": query,
      "bbox": "-66.453088,-17.762296,-65.758056,-17.238372",
      ...extraQueryParameters
    });
    final response = await _fetchRequest(request);
    if (response.statusCode != 200) {
      throw "Not found locations";
    } else {
      // location results
      final json = jsonDecode(utf8.decode(response.bodyBytes));
      final locationData = List<Map<String, dynamic>>.from(json["features"])
          .map((e) => LocationModel.fromJson(e));
      final locationDataCleaned = <String, LocationModel>{};

      for (final element in locationData) {
        locationDataCleaned[element.getCode] = element;
      }
      final trufiLocationList = locationDataCleaned.values
          .map(
            (x) => x.toTrufiLocation(),
          )
          .toList();

      // Streets results
      final streetData = await storage.fetchStreetsWithQuery(query)
        ..sort((a, b) => a.distance.compareTo(b.distance));

      final streetsFiltered = streetData
          .map((LevenshteinObject<TrufiPlace> l) => l.object)
          .take(4)
          .toList();

      return [...streetsFiltered, ...trufiLocationList];
    }
  }

  Future<http.Response> _fetchRequest(Uri request) async {
    try {
      final appName = await PackageInfoPlatform.appName();
      final packageInfoVersion = await PackageInfoPlatform.version();
      final uniqueId = TrufiAppId.getUniqueId;
      return await http.get(
        request,
        headers: {
          "User-Agent": "Trufi/$packageInfoVersion/$uniqueId/$appName",
        },
      );
    } on Exception catch (e) {
      throw FetchOnlineRequestException(e);
    }
  }

  @override
  Future<LocationDetail> reverseGeodecoding(TrufiLatLng location) async {
    final response = await _fetchRequest(
      Uri.parse(
        "$photonUrl/reverse?lon=${location.longitude}&lat=${location.latitude}",
      ),
    );
    final body = jsonDecode(utf8.decode(response.bodyBytes));
    if (body["type"] == "FeatureCollection") {
      final features = body["features"] as List;
      if (features.isNotEmpty) {
        final feature = features.first;
        final properties = feature["properties"];
        return LocationDetail(
            properties["name"], properties["street"] ?? "", location);
      }
    }
    throw Exception("no data found");
  }
}
