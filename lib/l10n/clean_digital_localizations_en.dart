


import 'clean_digital_localizations.dart';

/// The translations for English (`en`).
class CleanDigitalLocalizationsEn extends CleanDigitalLocalizations {
  CleanDigitalLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'CleanDigital';

  @override
  String get generalAppErrorMessage => 'Client error has occured!';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get serverErrorMessage => 'Server error has occured!';
}
