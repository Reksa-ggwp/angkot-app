import 'saved_places_localizations.dart';

/// The translations for English (`en`).
class SavedPlacesLocalizationId extends SavedPlacesLocalization {
  SavedPlacesLocalizationId([String locale = 'id']) : super(locale);

  @override
  String get chooseNowLabel => 'Pilih sekarang';

  @override
  String get chooseOnMap => 'Pilih di peta';

  @override
  String get commonCustomPlaces => 'Tempat kustom';

  @override
  String get commonFavoritePlaces => 'Tempat favorit';

  @override
  String defaultLocationAdd(Object defaultLocation) {
    return 'Tentukan alamat $defaultLocation';
  }

  @override
  String get defaultLocationHome => 'Rumah';

  @override
  String get defaultLocationWork => 'Kantor';

  @override
  String get iconlabel => 'Ikon';

  @override
  String instructionJunction(Object street1, Object street2) {
    return '$street1 dan $street2';
  }

  @override
  String get menuYourPlaces => 'Tempat favorit';

  @override
  String get nameLabel => 'Nama';

  @override
  String get savedPlacesEditLabel => 'Edit tempat';

  @override
  String get savedPlacesEnterNameTitle => 'Masukkan nama';

  @override
  String get savedPlacesEnterNameValidation => 'Nama tidak boleh kosong';

  @override
  String get savedPlacesRemoveLabel => 'Hapus tempat';

  @override
  String get savedPlacesSelectIconTitle => 'Tentukan simbol';

  @override
  String get savedPlacesSetIconLabel => 'Ubah simbol';

  @override
  String get savedPlacesSetNameLabel => 'Edit nama';

  @override
  String get savedPlacesSetPositionLabel => 'Edit posisi';

  @override
  String get searchTitleFavorites => 'Favorit';

  @override
  String get searchTitleRecent => 'Terkini';

  @override
  String get searchTitleResults => 'Hasil pencarian';

  @override
  String get selectedOnMap => 'Terpilih di peta';
}
