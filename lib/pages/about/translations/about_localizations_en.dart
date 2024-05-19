import 'about_localizations.dart';

/// The translations for English (`en`).
class AboutLocalizationEn extends AboutLocalization {
  AboutLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get aboutCollapseContent => 'Trufi Association is an international NGO that promotes easier access to public transport. Our apps help everyone find the best way to get from point A to point B within their cities.\n\nIn many cities there are no official maps, routes, apps or timetables. So we compile the available information, and sometimes even map routes from scratch working with local people who know the city.  An easy-to-use transportation system contributes to greater sustainability, cleaner air and a better quality of life.';

  @override
  String get aboutCollapseContentFoot => 'We need mappers, developers, planners, testers, and many other hands.';

  @override
  String get aboutCollapseTitle => 'More About Trufi Association';

  @override
  //String get aboutContent => 'Need to go somewhere and don\'t know which trufi or bus to take?\nThe Angkot makes it easy!\n\nTrufi Association is a team from Bolivia and beyond. We love La Llajta and public transportation, that\'s why we developed this application to make transportation easy. Our goal is to provide you with a practical tool that allows you to navigate with confidence.\n\nWe are committed to the continuous improvement of Angkot to offer you more and more accurate and useful information. We know that the transportation system in Medan undergoes changes due to different reasons, so it is possible that some routes are not completely up to date.\n\nTo make Angkot an effective tool, we rely on the collaboration of our users. If you are aware of changes in some routes or stops, we encourage you to share this information with us. Your contribution will not only help keep the app up to date, but will also benefit other users who rely on Angkot.\n\nThank you for choosing Angkot to move around Medan, we hope you enjoy your experience with us!';
  String get aboutContent => 'Reksa Anjangsara\'s (171401097) thesis prototype application';

  @override
  String get aboutCredits => 'Thanks to :';

  @override
  String get aboutCredits1 => 'University of North Sumatra';

  @override
  String get aboutCredits2 => 'Medan City Transportation Department';

  @override
  String get aboutCredits3 => 'Trufi Association';

  @override
  String get aboutLicenses => 'Licenses';

  @override
  String get aboutOpenSource => 'This app is released as open source on GitHub. Feel free to contribute to the code, or bring an app to your own city.';

  @override
  String get menuAbout => 'About me';

  @override
  String tagline(Object city) {
    return 'Public transportation application in $city';
  }

  @override
  String get trufiWebsite => 'Trufi Association Website';

  @override
  String version(Object version) {
    return 'Version $version';
  }

  @override
  String get volunteerTrufi => 'Volunteer For Trufi';
}
