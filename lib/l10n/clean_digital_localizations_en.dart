


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

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get system => 'System';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get login => 'Login';

  @override
  String get forgetPassword => 'Forget password?';

  @override
  String get enterYourEmail => 'Enter new email';

  @override
  String get restorePassword => 'Respore password';

  @override
  String get checkYourEmail => 'Check your email';

  @override
  String get emailIsNotValid => 'Email is not valid';

  @override
  String get passwordIsNotValid => 'Password length should be longer than 8 characters, contains one uppercase letter and number';
}
