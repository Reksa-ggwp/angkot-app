/*
import 'package:flutter/material.dart';
import 'package:trufi/pages/tracking/maps/leaftlet_map_trancking.dart';
import 'package:trufi/models/map_provider_collection/i_trufi_map_controller.dart';
import 'package:trufi/widgets/base_maps/leaflet_maps/leaflet_map_controller.dart';

typedef MapTrackingBuilder = Widget Function(
  BuildContext context,
);

abstract class MapTrackingProvider {
  ITrufiMapController get trufiMapController;
  MapTrackingBuilder get mapChooseLocationBuilder;
}

class LeafletMapTrackingProvider implements MapTrackingProvider {
  @override
  final ITrufiMapController trufiMapController;
  @override
  final MapTrackingBuilder mapChooseLocationBuilder;

  const LeafletMapTrackingProvider({
    required this.trufiMapController,
    required this.mapChooseLocationBuilder,
  });

  factory LeafletMapTrackingProvider.create() {
    final trufiMapController = LeafletMapController();
    return LeafletMapTrackingProvider(
      trufiMapController: trufiMapController,
      mapChooseLocationBuilder: (mapContext) {
        return LeaftletMapTracking(
          trufiMapController: trufiMapController,
        );
      },
    );
  }
}
*/