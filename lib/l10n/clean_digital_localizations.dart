
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'clean_digital_localizations_en.dart';
import 'clean_digital_localizations_uk.dart';

/// Callers can lookup localized strings with an instance of CleanDigitalLocalizations returned
/// by `CleanDigitalLocalizations.of(context)`.
///
/// Applications need to include `CleanDigitalLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/clean_digital_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CleanDigitalLocalizations.localizationsDelegates,
///   supportedLocales: CleanDigitalLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the CleanDigitalLocalizations.supportedLocales
/// property.
abstract class CleanDigitalLocalizations {
  CleanDigitalLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CleanDigitalLocalizations of(BuildContext context) {
    return Localizations.of<CleanDigitalLocalizations>(context, CleanDigitalLocalizations)!;
  }

  static const LocalizationsDelegate<CleanDigitalLocalizations> delegate = _CleanDigitalLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk')
  ];

  /// No description provided for @appName.
  ///
  /// In uk, this message translates to:
  /// **'CleanDigital'**
  String get appName;

  /// No description provided for @generalAppErrorMessage.
  ///
  /// In uk, this message translates to:
  /// **'Сталася помилка веб-клієнта'**
  String get generalAppErrorMessage;

  /// No description provided for @noInternetConnection.
  ///
  /// In uk, this message translates to:
  /// **'Немає інтернет звʼязку'**
  String get noInternetConnection;

  /// No description provided for @serverErrorMessage.
  ///
  /// In uk, this message translates to:
  /// **'Сталася серверна помилка'**
  String get serverErrorMessage;
}

class _CleanDigitalLocalizationsDelegate extends LocalizationsDelegate<CleanDigitalLocalizations> {
  const _CleanDigitalLocalizationsDelegate();

  @override
  Future<CleanDigitalLocalizations> load(Locale locale) {
    return SynchronousFuture<CleanDigitalLocalizations>(lookupCleanDigitalLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_CleanDigitalLocalizationsDelegate old) => false;
}

CleanDigitalLocalizations lookupCleanDigitalLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return CleanDigitalLocalizationsEn();
    case 'uk': return CleanDigitalLocalizationsUk();
  }

  throw FlutterError(
    'CleanDigitalLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
