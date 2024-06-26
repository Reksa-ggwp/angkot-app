import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:hive/hive.dart' show Hive;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show join;

import 'package:graphql/client.dart' show HiveStore;
import 'package:trufi/blocs/map_layer/map_layer_local_storage.dart';
import 'package:trufi/blocs/localization/trufi_localization_cubit.dart';
import 'package:trufi/blocs/map_tile_provider/map_tile_local_storage.dart';
import 'package:trufi/blocs/providers/app_review_provider.dart';
import 'package:trufi/blocs/theme/theme_cubit.dart';
import 'package:trufi/pages/home/repository/hive_local_repository.dart';
import 'package:trufi/pages/saved_places/repository/local_repository/hive_local_repository.dart';
import 'package:trufi/providers/transit_route/repository/hive_local_repository.dart';
import 'package:trufi/utils/trufi_app_id.dart';
import 'package:trufi/widgets/screen/lifecycle_reactor_notification.dart';

/// Initializes Hive with the path from [getApplicationDocumentsDirectory].
///
/// You can provide a [subDir] where the boxes should be stored.
///
/// Extracted from [`hive_flutter` source][github]
///
/// [github]: https://github.com/hivedb/hive/blob/5bf355496650017409fef4e9905e8826c5dc5bf3/hive_flutter/lib/src/hive_extensions.dart
Future<void> initHiveForFlutter({
  String? subDir,
  List<String> boxes = listPathsHive,
}) async {
  if (!kIsWeb) {
    var appDir = await getApplicationDocumentsDirectory();
    var path = appDir.path;
    if (subDir != null) {
      path = join(path, subDir);
    }
    HiveStore.init(onPath: path);
  }
  await HiveStore.open(boxName: HiveStore.defaultBoxName);
  for (var box in boxes) {
    await Hive.openBox(box);
  }
}

const listPathsHive = [
  AppReviewProviderHiveLocalRepository.path,
  TrufiLocalizationHiveLocalRepository.path,
  TrufiBaseThemeHiveLocalRepository.path,
  MapRouteHiveLocalRepository.path,
  SearchLocationsHiveLocalRepository.path,
  RouteTransportsHiveLocalRepository.path,
  MapTileLocalStorage.customLayersStorage,
  TrufiAppId.path,
  LifecycleReactorNotifications.path,
  MapLayerLocalStorage.path,
];
