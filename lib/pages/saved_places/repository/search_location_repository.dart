import 'package:trufi/models/trufi_latlng.dart';
import 'package:trufi/models/trufi_place.dart';

abstract class SearchLocationRepository {
  Future<List<TrufiPlace>> fetchLocations(
    String query, {
    int limit,
    String? correlationId,
  });

  Future<LocationDetail> reverseGeodecoding(TrufiLatLng location);
}
