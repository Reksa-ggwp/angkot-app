import 'package:trufi/models/map_provider_collection/trufi_map_definition.dart';
import 'package:trufi/pages/transport_list/transport_list_detail/maps/leaflet_map_transport.dart';
import 'package:trufi/models/map_provider_collection/i_trufi_map_controller.dart';
import 'package:trufi/widgets/base_maps/leaflet_maps/leaflet_map_controller.dart';

class LeafletMapTransportProvider implements MapTransportProvider {
  @override
  final ITrufiMapController trufiMapController;
  @override
  final MapTransportBuilder mapTransportBuilder;
  @override
  final Uri? shareBaseRouteUri;

  @override
  MapTransportProvider rebuild() {
    return LeafletMapTransportProvider.create(
      shareBaseRouteUri: shareBaseRouteUri,
    );
  }

  const LeafletMapTransportProvider({
    required this.trufiMapController,
    required this.mapTransportBuilder,
    this.shareBaseRouteUri,
  });

  factory LeafletMapTransportProvider.create({
    Uri? shareBaseRouteUri,
  }) {
    final trufiMapController = LeafletMapController();
    return LeafletMapTransportProvider(
      trufiMapController: trufiMapController,
      mapTransportBuilder: (mapContext, transportData) {
        return LeafletMapTransport(
          trufiMapController: trufiMapController,
          transportData: transportData,
          shareBaseRouteUri: shareBaseRouteUri,
        );
      },
      shareBaseRouteUri: shareBaseRouteUri,
    );
  }
}
