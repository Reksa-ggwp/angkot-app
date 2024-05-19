import 'feedback_localizations.dart';

/// The translations for English (`en`).
class FeedbackLocalizationId extends FeedbackLocalization {
  FeedbackLocalizationId([String locale = 'id']) : super(locale);

  @override
  String get menuFeedback => 'Kirim masukan';

  @override
  String get feedbackTitle => 'Kirim kami komentar';

  @override
  String get feedbackContent => 'Apakah anda memiliki saran untuk aplikasi kami atau menemukan beberapa kesalahan pada data? Kami ingin sekali mendengar pendapat anda! Pastikan untuk menambahkan alamat email atau telepon anda, sehingga kami dapat merespons anda.';
}
