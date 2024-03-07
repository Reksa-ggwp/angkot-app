import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

import 'package:trufi/models/trufi_latlng.dart';
import 'package:trufi/models/map_provider_collection/i_trufi_map_controller.dart';
import 'package:trufi/widgets/base_maps/leaflet_maps/utils/trufi_map_animations.dart';

class LeafletMapController implements ITrufiMapController {
  static const int animationDuration = 500;
  MapController mapController = MapController();
  LeafletMapController() : super();

  LatLngBounds get selectedBounds => _selectedBounds;
  LatLngBounds _selectedBounds = LatLngBounds();
  // ignore: prefer_void_to_null
  final Completer<Null> readyCompleter = Completer<Null>();

  @override
  // ignore: prefer_void_to_null
  Future<Null> get onReady => readyCompleter.future;

  @override
  void cleanMap() {
    _selectedBounds = LatLngBounds();
  }

  @override
  Future<void> moveToYourLocation({
    required BuildContext context,
    required TrufiLatLng location,
    required double zoom,
    TickerProvider? tickerProvider,
  }) async {
    move(
      center: location,
      zoom: zoom,
      tickerProvider: tickerProvider,
    );
    return;
  }

  @override
  void moveBounds({
    required List<TrufiLatLng> points,
    required TickerProvider tickerProvider,
  }) {
    _selectedBounds = LatLngBounds();
    for (final point in points) {
      _selectedBounds.extend(point.toLatLng());
    }
    _fitBounds(bounds: _selectedBounds, tickerProvider: tickerProvider);
  }

  @override
  void moveCurrentBounds({
    required TickerProvider tickerProvider,
  }) {
    _fitBounds(
      bounds: _selectedBounds,
      tickerProvider: tickerProvider,
    );
  }

  @override
  void move({
    required TrufiLatLng center,
    required double zoom,
    TickerProvider? tickerProvider,
  }) {
    if (tickerProvider == null) {
      mapController.move(center.toLatLng(), zoom);
    } else {
      TrufiMapAnimations.move(
        center: center.toLatLng(),
        zoom: zoom,
        tickerProvider: tickerProvider,
        milliseconds: animationDuration,
        mapController: mapController,
      );
    }
  }

  void _fitBounds({
    required LatLngBounds bounds,
    TickerProvider? tickerProvider,
  }) {
    if (tickerProvider == null) {
      mapController.fitBounds(bounds);
    } else {
      TrufiMapAnimations.fitBounds(
        bounds: bounds,
        tickerProvider: tickerProvider,
        milliseconds: animationDuration,
        mapController: mapController,
      );
    }
  }
}
