


import 'clean_digital_localizations.dart';

/// The translations for Ukrainian (`uk`).
class CleanDigitalLocalizationsUk extends CleanDigitalLocalizations {
  CleanDigitalLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'CleanDigital';

  @override
  String get generalAppErrorMessage => 'Сталася помилка веб-клієнта';

  @override
  String get noInternetConnection => 'Немає інтернет звʼязку';

  @override
  String get serverErrorMessage => 'Сталася серверна помилка';

  @override
  String get dark => 'Темна';

  @override
  String get light => 'Світла';

  @override
  String get system => 'Системна';
}
