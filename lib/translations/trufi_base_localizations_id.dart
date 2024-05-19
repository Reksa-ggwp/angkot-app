import 'trufi_base_localizations.dart';

/// The translations for English (`id`).
class TrufiBaseLocalizationId extends TrufiBaseLocalization {
  TrufiBaseLocalizationId([String locale = 'id']) : super(locale);

  @override
  String get alertLocationServicesDeniedMessage => 'Pastikan perangkat Anda memiliki GPS dan pengaturan Lokasi diaktifkan.';

  @override
  String get alertLocationServicesDeniedTitle => 'Tidak ada lokasi';

  @override
  String get appReviewDialogButtonAccept => 'Tulis ulasan';

  @override
  String get appReviewDialogButtonDecline => 'Tidak sekarang';

  @override
  String get appReviewDialogContent => 'Dukung kami dengan menulis ulasan Google Play Store.';

  @override
  String get appReviewDialogTitle => 'Menikmati angkot?';

  @override
  String get chooseLocationPageSubtitle => 'Geser & perbesar peta di bawah pin';

  @override
  String get chooseLocationPageTitle => 'Pilih titik';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonConfirmLocation => 'Pastikan lokasi';

  @override
  String get commonDestination => 'Tujuan';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonError => 'Error';

  @override
  String get commonFromStation => 'dari stasiun';

  @override
  String get commonFromStop => 'dari perhentian';

  @override
  String get commonItineraryNoTransitLegs => 'Tinggalkan jika itu cocok untuk Anda';

  @override
  String get commonLeavesAt => 'Berangkat';

  @override
  String get commonLoading => 'Loading...';

  @override
  String get commonNoInternet => 'Tidak ada koneksi internet';

  @override
  String get commonNoResults => 'Tidak ada hasil';

  @override
  String get commonOK => 'OK';

  @override
  String get commonOrigin => 'Asal';

  @override
  String get commonRemove => 'Hapus';

  @override
  String get commonSave => 'Simpan';

  @override
  String get commonTomorrow => 'Besok';

  @override
  String get commonUnknownError => 'Error tak diketahui';

  @override
  String get commonUnkownPlace => 'Tempat tak diketahui';

  @override
  String get commonWait => 'Tunggu';

  @override
  String get commonWalk => 'Jalan';

  @override
  String get commonYourLocation => 'Lokasi anda';

  @override
  String get errorAmbiguousDestination => 'Perencana perjalanan tidak yakin dengan lokasi yang ingin anda tuju. Silakan pilih dari opsi berikut, atau lebih spesifik';

  @override
  String get errorAmbiguousOrigin => 'Perencana perjalanan tidak yakin dari mana anda ingin memulai. Silakan pilih dari opsi berikut, atau lebih spesifik';

  @override
  String get errorAmbiguousOriginDestination => 'Asal dan tujuannya tidak jelas. Silakan pilih dari opsi berikut, atau lebih spesifik';

  @override
  String get errorNoBarrierFree => 'Titik asal dan tujuan tidak dapat diakses oleh kursi roda';

  @override
  String get errorNoConnectServer => 'Tidak ada koneksi dengan server';

  @override
  String get errorNoTransitTimes => 'Tidak ada waktu transit yang tersedia. Tanggalnya mungkin sudah lewat atau terlalu jauh di masa depan atau mungkin tidak ada layanan transit untuk perjalanan anda pada waktu yang anda pilih.';

  @override
  String get errorOutOfBoundary => 'Perjalanan tidak memungkinkan. Anda mungkin mencoba merencanakan perjalanan di luar batas data peta.';

  @override
  String get errorPathNotFound => 'Perjalanan tidak memungkinkan. Titik awal dan akhir Anda mungkin tidak dapat diakses dengan aman (misalnya, Anda mungkin memulai dari jalan perumahan yang hanya terhubung ke jalan raya).';

  @override
  String get errorServerCanNotHandleRequest => 'Permintaan memiliki kesalahan yang tidak dapat atau tidak dapat diproses oleh server.';

  @override
  String get errorServerTimeout => 'Perencana perjalanan membutuhkan waktu terlalu lama untuk memproses permintaan Anda. Silakan coba lagi nanti.';

  @override
  String get errorServerUnavailable => 'Kami meminta maaf. Perencana perjalanan untuk sementara tidak tersedia. Silakan coba lagi nanti.';

  @override
  String get errorTrivialDistance => 'Titik asal berada dalam jarak yang tidak jauh dari tujuan.';

  @override
  String get errorUnknownDestination => 'Titik tujuan tidak diketahui. Bisakah Anda lebih deskriptif?';

  @override
  String get errorUnknownOrigin => 'Titik asal tidak diketahui. Bisakah Anda lebih deskriptif?';

  @override
  String get errorUnknownOriginDestination => 'Kedua titik asal dan tujuan tidak diketahui. Bisakah Anda lebih deskriptif?';

  @override
  String followOnSocialMedia(Object value) {
    return 'Ikuti kami di $value';
  }

  @override
  String instructionDistanceKm(Object value) {
    return '$value km';
  }

  @override
  String instructionDistanceMeters(Object value) {
    return '$value m';
  }

  @override
  String instructionDurationHours(Object value) {
    return '$value h';
  }

  @override
  String instructionDurationMinutes(Object value) {
    return '$value min';
  }

  @override
  String get instructionVehicleBike => 'Sepeda';

  @override
  String get instructionVehicleBus => 'Bus';

  @override
  String get instructionVehicleCar => 'Mobil';

  @override
  String get instructionVehicleCarpool => 'Mobil berbagi';

  @override
  String get instructionVehicleCommuterTrain => 'Kereta komuter';

  @override
  String get instructionVehicleGondola => 'Gondola';

  @override
  String get instructionVehicleLightRail => 'Kereta api ringan';

  @override
  String get instructionVehicleMetro => 'Metro';

  @override
  String get instructionVehicleMicro => 'Microbus';

  @override
  String get instructionVehicleMinibus => 'Minibus';

  @override
  String get instructionVehicleTrufi => 'Angkot';

  @override
  String get instructionVehicleWalk => 'Jalan';

  @override
  String get menuConnections => 'Perencana rute';

  @override
  String get menuSocialMedia => 'Media sosial';

  @override
  String get menuTransportList => 'Tampilkan rute';

  @override
  String get noRouteError => 'Maaf, kami tidak dapat menemukan rute. Apa yang ingin kamu lakukan?';

  @override
  String get noRouteErrorActionCancel => 'Coba tujuan lain';

  @override
  String get noRouteErrorActionReportMissingRoute => 'Laporkan rute hilang';

  @override
  String get noRouteErrorActionShowCarRoute => 'Tampilkan rute dengan mobil';

  @override
  String get notShowAgain => 'Jangan tampilkan lagi';

  @override
  String get readOurBlog => 'Baca blog kami';

  @override
  String get searchFailLoadingPlan => 'Gagal memuat rencana';

  @override
  String get searchHintDestination => 'Pilih titik tujuan';

  @override
  String get searchHintOrigin => 'Pilih titik asal';

  @override
  String get searchPleaseSelectDestination => 'Pilih titik tujuan';

  @override
  String get searchPleaseSelectOrigin => 'Pilih titik asal';

  @override
  String shareAppText(Object url, Object appTitle, Object cityName) {
    return 'Unduh $appTitle, aplikasi transportasi umum untuk kota $cityName, di $url';
  }

  @override
  String get commonShowMap => 'Tunjukkan di peta';

  @override
  String get commonMapSettings => 'Pengaturan peta';

  @override
  String get mapTypeLabel => 'Tipe peta';

  @override
  String get selectYourPointInterest => 'Minat';

  @override
  String get themeModeDark => 'Tema gelap';

  @override
  String get themeModeLight => 'Tema terang';

  @override
  String get themeModeSystem => 'Bawaan sistem';
}
