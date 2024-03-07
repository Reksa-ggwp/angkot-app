import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:trufi/models/enums/defaults_location.dart';
import 'package:trufi/models/trufi_latlng.dart';
import 'package:trufi/models/trufi_place.dart';
import 'package:trufi/pages/saved_places/repository/local_repository/hive_local_repository.dart';
import 'package:trufi/pages/saved_places/repository/search_location_repository.dart';
import 'package:trufi/pages/saved_places/repository/local_repository.dart';

part 'search_locations_state.dart';

class SearchLocationsCubit extends Cubit<SearchLocationsState> {
  final SearchLocationsLocalRepository _localRepository =
      SearchLocationsHiveLocalRepository();

  final SearchLocationRepository searchLocationRepository;
  Timer _debounceTimer = Timer(const Duration(milliseconds: 300), () {});

  SearchLocationsCubit({
    required this.searchLocationRepository,
  }) : super(const SearchLocationsState()) {
    _initLoad();
  }

  Future<void> _initLoad() async {
    await _localRepository.loadRepository();
    List<TrufiLocation> myDefaultPlaces =
        await _localRepository.getMyDefaultPlaces();
    if (myDefaultPlaces.isEmpty) {
      myDefaultPlaces = [
        DefaultLocation.defaultHome.initLocation,
        DefaultLocation.defaultWork.initLocation,
      ];
    }
    emit(state.copyWith(
      myPlaces: await _localRepository.getMyPlaces(),
      myDefaultPlaces: myDefaultPlaces,
      favoritePlaces: await _localRepository.getFavoritePlaces(),
      historyPlaces: await _localRepository.getHistoryPlaces(),
    ));
    await _localRepository.saveMyDefaultPlaces(state.myDefaultPlaces);
  }

  void insertMyPlace(TrufiLocation location) {
    emit(state.copyWith(myPlaces: [...state.myPlaces, location]));
    _localRepository.saveMyPlaces(state.myPlaces);
  }

  void insertHistoryPlace(TrufiLocation location) {
    emit(state.copyWith(historyPlaces: [
      ..._deleteAllItem(state.historyPlaces, location),
      location,
    ]));
    _localRepository.saveHistoryPlaces(state.historyPlaces);
  }

  void insertFavoritePlace(TrufiLocation location) {
    emit(state.copyWith(favoritePlaces: [...state.favoritePlaces, location]));
    _localRepository.saveFavoritePlaces(state.favoritePlaces);
  }

  void updateMyPlace(TrufiLocation old, TrufiLocation location) {
    emit(
      state.copyWith(myPlaces: [..._updateItem(state.myPlaces, old, location)]),
    );
    _localRepository.saveMyPlaces(state.myPlaces);
  }

  void updateMyDefaultPlace(TrufiLocation old, TrufiLocation location) {
    emit(
      state.copyWith(myDefaultPlaces: [
        ..._updateItem(state.myDefaultPlaces, old, location)
      ]),
    );
    _localRepository.saveMyDefaultPlaces(state.myDefaultPlaces);
  }

  void updateHistoryPlace(TrufiLocation old, TrufiLocation location) {
    emit(
      state.copyWith(
          historyPlaces: [..._updateItem(state.historyPlaces, old, location)]),
    );
    _localRepository.saveHistoryPlaces(state.historyPlaces);
  }

  void updateFavoritePlace(TrufiLocation old, TrufiLocation location) {
    emit(
      state.copyWith(favoritePlaces: [
        ..._updateItem(
          state.favoritePlaces,
          old,
          location,
        )
      ]),
    );
    _localRepository.saveFavoritePlaces(state.favoritePlaces);
  }

  void deleteMyPlace(TrufiLocation location) {
    emit(state.copyWith(
      myPlaces: _deleteItem(state.myPlaces, location),
    ));
    _localRepository.saveMyPlaces(state.myPlaces);
  }

  void deleteHistoryPlace(TrufiLocation location) {
    emit(state.copyWith(
      historyPlaces: _deleteItem(state.historyPlaces, location),
    ));
    _localRepository.saveHistoryPlaces(state.historyPlaces);
  }

  void deleteFavoritePlace(TrufiLocation location) {
    emit(state.copyWith(
      favoritePlaces: _deleteItem(state.favoritePlaces, location),
    ));
    _localRepository.saveFavoritePlaces(state.favoritePlaces);
  }

  List<TrufiPlace> getHistoryList() {
    return state.historyPlaces.reversed.toList();
  }

  Future<void> fetchLocations(
    String query, {
    String? correlationId,
    int limit = 30,
  }) async {
    _debounceTimer.cancel();
    emit(state.copyWith(isLoading: true));
    
    _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
      if (query.isNotEmpty) {
        final results = await searchLocationRepository.fetchLocations(
          query,
          limit: limit,
          correlationId: correlationId,
        );
        emit(state.copyWith(
          searchResult: results,
          isLoading: false,
        ));
      } else {
        emit(state.copyWith(searchResult: [], isLoading: false));
      }
    });
  }

  List<TrufiPlace> sortedByFavorites(
    List<TrufiPlace> locations,
  ) {
    locations.sort((a, b) {
      return _sortByFavoriteLocations(a, b, state.favoritePlaces);
    });
    return locations;
  }

  List<TrufiLocation> _updateItem(
    List<TrufiLocation> list,
    TrufiLocation oldLocation,
    TrufiLocation newLocation,
  ) {
    final tempList = [...list];
    final int index = tempList.indexOf(oldLocation);
    if (index != -1) {
      tempList.replaceRange(index, index + 1, [newLocation]);
    }
    return tempList;
  }

  List<TrufiLocation> _deleteItem(
    List<TrufiLocation> list,
    TrufiLocation location,
  ) {
    final tempList = [...list];
    tempList.remove(location);
    return tempList;
  }

  List<TrufiLocation> _deleteAllItem(
    List<TrufiLocation> list,
    TrufiLocation location,
  ) {
    final tempList = [...list];
    return tempList.where((value) => value != location).toList();
  }

  int _sortByFavoriteLocations(
    TrufiPlace a,
    TrufiPlace b,
    List<TrufiLocation> favorites,
  ) {
    final bool aIsAvailable = (a is TrufiLocation) && favorites.contains(a);
    final bool bIsAvailable = (b is TrufiLocation) && favorites.contains(b);
    return aIsAvailable == bIsAvailable
        ? 0
        : aIsAvailable
            ? -1
            : 1;
  }

  Future<LocationDetail> reverseGeodecoding(TrufiLatLng location) =>
      searchLocationRepository.reverseGeodecoding(
        location,
      );
}
