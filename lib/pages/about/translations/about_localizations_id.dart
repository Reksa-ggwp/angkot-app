import 'about_localizations.dart';

/// The translations for English (`en`).
class AboutLocalizationId extends AboutLocalization {
  AboutLocalizationId([String locale = 'id']) : super(locale);

  @override
  String get aboutCollapseContent => 'Trufi Association adalah LSM internasional yang mempromosikan akses yang lebih mudah ke transportasi umum. Aplikasi kami membantu semua orang menemukan cara terbaik untuk pergi dari titik A ke titik B di kota mereka.\n\nDi banyak kota tidak ada peta, rute, aplikasi, atau jadwal resmi. Jadi kami mengumpulkan informasi yang tersedia, dan terkadang bahkan memetakan rute dari awal bekerja sama dengan masyarakat lokal yang mengetahui kota tersebut. Sistem transportasi yang mudah digunakan berkontribusi terhadap keberlanjutan yang lebih baik, udara yang lebih bersih, dan kualitas hidup yang lebih baik.';

  @override
  String get aboutCollapseContentFoot => 'Kita membutuhkan pembuat peta, pengembang, perencana, penguji, dan banyak pihak lainnya.';

  @override
  String get aboutCollapseTitle => 'Lebih Lanjut Tentang Asosiasi Trufi';

  @override
  //String get aboutContent => 'Perlu pergi ke suatu tempat dan tidak tahu angkot atau bus mana yang harus diambil?\nAngkot memudahkannya!\n\nTrufi Association adalah tim dari Bolivia dan sekitarnya. Kami menyukai La Llajta dan transportasi umum, itulah sebabnya kami mengembangkan aplikasi ini untuk memudahkan transportasi. Tujuan kami adalah memberi Anda alat praktis yang memungkinkan Anda bernavigasi dengan percaya diri.\n\nKami berkomitmen terhadap peningkatan berkelanjutan pada Angkot untuk menawarkan informasi yang lebih akurat dan berguna kepada Anda. Kami tahu bahwa sistem transportasi di Medan mengalami perubahan karena berbagai alasan, sehingga ada kemungkinan beberapa rute tidak sepenuhnya mutakhir.\n\nUntuk menjadikan Angkot sebagai alat yang efektif, kami mengandalkan kolaborasi pengguna kami. Jika Anda mengetahui adanya perubahan pada beberapa rute atau pemberhentian, kami menganjurkan anda untuk membagikan informasi ini kepada kami. Kontribusi anda tidak hanya membantu menjaga aplikasi tetap mutakhir, namun juga bermanfaat bagi pengguna lain yang mengandalkan Angkot.\n\nTerima kasih telah memilih Angkot untuk berkeliling Medan, kami harap anda menikmati pengalaman anda bersama kami!';
  String get aboutContent => 'Aplikasi protoype skripsi Reksa Anjangsara (171401097)';

  @override
  String get aboutCredits => 'Terima kasih kepada :';

  @override
  String get aboutCredits1 => 'Universitas Sumatera Utara';

  @override
  String get aboutCredits2 => 'Dinas Perhubungan Kota Medan';

  @override
  String get aboutCredits3 => 'Asosiasi Trufi';

  @override
  String get aboutLicenses => 'Lisensi';

  @override
  String get aboutOpenSource => 'Aplikasi ini dirilis sebagai open source di GitHub. Jangan ragu untuk berkontribusi pada kode, atau membawa aplikasi ke kota anda sendiri.';

  @override
  String get menuAbout => 'Tentang saya';

  @override
  String tagline(Object city) {
    return 'Aplikasi transportasi publik di $city';
  }

  @override
  String get trufiWebsite => 'Website Trufi Association';

  @override
  String version(Object version) {
    return 'Versi $version';
  }

  @override
  String get volunteerTrufi => 'Relawan untuk Trufi';
}
