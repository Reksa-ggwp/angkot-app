import 'package:flutter/material.dart';
import 'package:trufi/models/map_provider_collection/trufi_map_definition.dart';
import 'package:trufi/pages/transport_list/transport_list_detail/maps/map_transport_provider.dart';
import 'package:trufi/pages/home/widgets/trufi_map_route/maps/map_route_provider.dart';
import 'package:trufi/widgets/choose_location/maps/map_choose_location_provider.dart';
import 'package:trufi/widgets/route_editor/maps/map_route_editor_provider.dart';

class LeafletMapCollection implements ITrufiMapProvider {
  @override
  MapChooseLocationProvider mapChooseLocationProvider() {
    return LeafletMapChooseLocationProvider.create();
  }

  @override
  MapRouteProvider mapRouteProvider({
    Uri? shareBaseItineraryUri,
    WidgetBuilder? overlapWidget,
  }) {
    return LeafletMapRouteProvider.create(
      shareBaseItineraryUri: shareBaseItineraryUri,
      overlapWidget: overlapWidget,
    );
  }

  @override
  MapTransportProvider mapTransportProvider({
    Uri? shareBaseRouteUri,
  }) {
    return LeafletMapTransportProvider.create(
      shareBaseRouteUri: shareBaseRouteUri,
    );
  }

  @override
  MapRouteEditorProvider mapRouteEditorProvider({bool isSelectionArea = true}) {
    return LeafletMapRouteEditorProvider.create(
      isSelectionArea: isSelectionArea,
    );
  }
}
