import 'package:trufi/models/map_provider_collection/trufi_map_definition.dart';
import 'package:trufi/widgets/choose_location/maps/leaflet_map_choose_location.dart';
import 'package:trufi/models/map_provider_collection/i_trufi_map_controller.dart';
import 'package:trufi/widgets/base_maps/leaflet_maps/leaflet_map_controller.dart';

class LeafletMapChooseLocationProvider implements MapChooseLocationProvider {
  @override
  final ITrufiMapController trufiMapController;
  @override
  final MapChooseLocationBuilder mapChooseLocationBuilder;

  @override
  MapChooseLocationProvider rebuild() {
    return LeafletMapChooseLocationProvider.create();
  }

  const LeafletMapChooseLocationProvider({
    required this.trufiMapController,
    required this.mapChooseLocationBuilder,
  });

  factory LeafletMapChooseLocationProvider.create() {
    final trufiMapController = LeafletMapController();
    return LeafletMapChooseLocationProvider(
      trufiMapController: trufiMapController,
      mapChooseLocationBuilder: (mapContext, onCenterChanged) {
        return LeaftletMapChooseLocation(
          trufiMapController: trufiMapController,
          onCenterChanged: onCenterChanged,
        );
      },
    );
  }

}
