
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

  /// No description provided for @dark.
  ///
  /// In uk, this message translates to:
  /// **'Темна'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In uk, this message translates to:
  /// **'Світла'**
  String get light;

  /// No description provided for @system.
  ///
  /// In uk, this message translates to:
  /// **'Системна'**
  String get system;

  /// No description provided for @email.
  ///
  /// In uk, this message translates to:
  /// **'Електронна пошта'**
  String get email;

  /// No description provided for @password.
  ///
  /// In uk, this message translates to:
  /// **'Пароль'**
  String get password;

  /// No description provided for @login.
  ///
  /// In uk, this message translates to:
  /// **'Увійти'**
  String get login;

  /// No description provided for @forgetPassword.
  ///
  /// In uk, this message translates to:
  /// **'Забул пароль?'**
  String get forgetPassword;

  /// No description provided for @enterYourEmail.
  ///
  /// In uk, this message translates to:
  /// **'Введіть вашу електронну пошту'**
  String get enterYourEmail;

  /// No description provided for @restorePassword.
  ///
  /// In uk, this message translates to:
  /// **'Відновити пароль'**
  String get restorePassword;

  /// No description provided for @checkYourEmail.
  ///
  /// In uk, this message translates to:
  /// **'Перевірте вашу пошту'**
  String get checkYourEmail;

  /// No description provided for @emailIsNotValid.
  ///
  /// In uk, this message translates to:
  /// **'Введіть коректну пошту'**
  String get emailIsNotValid;

  /// No description provided for @passwordIsNotValid.
  ///
  /// In uk, this message translates to:
  /// **'Довжина пароля повинна бути більше 8 символів, містити одну велику літеру та цифру'**
  String get passwordIsNotValid;

  /// No description provided for @admin.
  ///
  /// In uk, this message translates to:
  /// **'Адміністратор'**
  String get admin;

  /// No description provided for @laundry.
  ///
  /// In uk, this message translates to:
  /// **'Пральня'**
  String get laundry;

  /// No description provided for @employee.
  ///
  /// In uk, this message translates to:
  /// **'Робітник'**
  String get employee;

  /// No description provided for @client.
  ///
  /// In uk, this message translates to:
  /// **'Клієнт'**
  String get client;

  /// No description provided for @iot.
  ///
  /// In uk, this message translates to:
  /// **'IOT'**
  String get iot;

  /// No description provided for @repairCompany.
  ///
  /// In uk, this message translates to:
  /// **'Ремонтна компанія'**
  String get repairCompany;

  /// No description provided for @youHaveNotAccess.
  ///
  /// In uk, this message translates to:
  /// **'Ви не маєте доступу'**
  String get youHaveNotAccess;

  /// No description provided for @laundries.
  ///
  /// In uk, this message translates to:
  /// **'Пральні'**
  String get laundries;

  /// No description provided for @repairCompanies.
  ///
  /// In uk, this message translates to:
  /// **'Ремонтні компанії'**
  String get repairCompanies;

  /// No description provided for @clients.
  ///
  /// In uk, this message translates to:
  /// **'Клієнти'**
  String get clients;

  /// No description provided for @backups.
  ///
  /// In uk, this message translates to:
  /// **'Бекапи'**
  String get backups;

  /// No description provided for @statistic.
  ///
  /// In uk, this message translates to:
  /// **'Статистика'**
  String get statistic;

  /// No description provided for @settings.
  ///
  /// In uk, this message translates to:
  /// **'Налаштування'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In uk, this message translates to:
  /// **'Вийти'**
  String get logout;

  /// No description provided for @launguage.
  ///
  /// In uk, this message translates to:
  /// **'Мова'**
  String get launguage;

  /// No description provided for @theme.
  ///
  /// In uk, this message translates to:
  /// **'Тема'**
  String get theme;

  /// No description provided for @addNew.
  ///
  /// In uk, this message translates to:
  /// **'Додати нового'**
  String get addNew;

  /// No description provided for @english.
  ///
  /// In uk, this message translates to:
  /// **'Англійська'**
  String get english;

  /// No description provided for @ukrainian.
  ///
  /// In uk, this message translates to:
  /// **'Українська'**
  String get ukrainian;

  /// No description provided for @aboutAdmin.
  ///
  /// In uk, this message translates to:
  /// **'Про адміністратора'**
  String get aboutAdmin;

  /// No description provided for @deleteAccount.
  ///
  /// In uk, this message translates to:
  /// **'Видалити акаунт'**
  String get deleteAccount;

  /// No description provided for @yes.
  ///
  /// In uk, this message translates to:
  /// **'Так'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In uk, this message translates to:
  /// **'Ні'**
  String get no;

  /// No description provided for @edit.
  ///
  /// In uk, this message translates to:
  /// **'Редагувати'**
  String get edit;

  /// No description provided for @updatePassword.
  ///
  /// In uk, this message translates to:
  /// **'Оновити пароль'**
  String get updatePassword;

  /// No description provided for @newPassword.
  ///
  /// In uk, this message translates to:
  /// **'Новий пароль'**
  String get newPassword;

  /// No description provided for @doYouWantToDeleteAccount.
  ///
  /// In uk, this message translates to:
  /// **'Ви дійсно хочете видалити акаунт?'**
  String get doYouWantToDeleteAccount;

  /// No description provided for @save.
  ///
  /// In uk, this message translates to:
  /// **'Зберегти'**
  String get save;

  /// No description provided for @registerAdmin.
  ///
  /// In uk, this message translates to:
  /// **'Зареєструвати адміністратора'**
  String get registerAdmin;

  /// No description provided for @registerIOT.
  ///
  /// In uk, this message translates to:
  /// **'Зареєструвати  IOT'**
  String get registerIOT;

  /// No description provided for @pageLoadError.
  ///
  /// In uk, this message translates to:
  /// **'Відбувалася помилка при завантаженні. Повторити?'**
  String get pageLoadError;

  /// No description provided for @error.
  ///
  /// In uk, this message translates to:
  /// **'Помилка'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In uk, this message translates to:
  /// **'Повторити'**
  String get retry;

  /// No description provided for @totalAmount.
  ///
  /// In uk, this message translates to:
  /// **'Загальна кількість'**
  String get totalAmount;

  /// No description provided for @noMoreItems.
  ///
  /// In uk, this message translates to:
  /// **'Більше елементів немає...'**
  String get noMoreItems;

  /// No description provided for @name.
  ///
  /// In uk, this message translates to:
  /// **'Імʼя/назва'**
  String get name;

  /// No description provided for @phone.
  ///
  /// In uk, this message translates to:
  /// **'Телефон'**
  String get phone;

  /// No description provided for @address.
  ///
  /// In uk, this message translates to:
  /// **'Адреса'**
  String get address;

  /// No description provided for @maxWashMachines.
  ///
  /// In uk, this message translates to:
  /// **'Максимальна кількість машинок'**
  String get maxWashMachines;

  /// No description provided for @more.
  ///
  /// In uk, this message translates to:
  /// **'Детальніше...'**
  String get more;

  /// No description provided for @requiredField.
  ///
  /// In uk, this message translates to:
  /// **'Обовʼязове поле'**
  String get requiredField;

  /// No description provided for @registerLaundry.
  ///
  /// In uk, this message translates to:
  /// **'Зареєструвати пральню'**
  String get registerLaundry;

  /// No description provided for @updateLaundry.
  ///
  /// In uk, this message translates to:
  /// **'Оновити пральню'**
  String get updateLaundry;

  /// No description provided for @mustBeFromNumbers.
  ///
  /// In uk, this message translates to:
  /// **'Поле повинно бути із цифр'**
  String get mustBeFromNumbers;

  /// No description provided for @maxLenght.
  ///
  /// In uk, this message translates to:
  /// **'Максимальна довжина'**
  String get maxLenght;

  /// No description provided for @backupCreated.
  ///
  /// In uk, this message translates to:
  /// **'Бекап створено'**
  String get backupCreated;

  /// No description provided for @backupRestored.
  ///
  /// In uk, this message translates to:
  /// **'Бекап відновлено'**
  String get backupRestored;

  /// No description provided for @restore.
  ///
  /// In uk, this message translates to:
  /// **'Відновити'**
  String get restore;

  /// No description provided for @delete.
  ///
  /// In uk, this message translates to:
  /// **'Видалити'**
  String get delete;

  /// No description provided for @doYouWantToDeleteLaundry.
  ///
  /// In uk, this message translates to:
  /// **'Ви дійсно хочете видалити пральню?'**
  String get doYouWantToDeleteLaundry;

  /// No description provided for @doYouWantToDeleteRepairCompany.
  ///
  /// In uk, this message translates to:
  /// **'Ви дійсно хочете видалити ремонтну компанію?'**
  String get doYouWantToDeleteRepairCompany;

  /// No description provided for @registerRepairCompany.
  ///
  /// In uk, this message translates to:
  /// **'Зареєструвати ремонтну компанію'**
  String get registerRepairCompany;

  /// No description provided for @updateRepairCompany.
  ///
  /// In uk, this message translates to:
  /// **'Оновити ремонтну компанію'**
  String get updateRepairCompany;

  /// No description provided for @doYouWantToDeleteClient.
  ///
  /// In uk, this message translates to:
  /// **'Ви дійсно хочете клієнта?'**
  String get doYouWantToDeleteClient;

  /// No description provided for @sale.
  ///
  /// In uk, this message translates to:
  /// **'Знижка'**
  String get sale;

  /// No description provided for @bonuses.
  ///
  /// In uk, this message translates to:
  /// **'Бонуси'**
  String get bonuses;
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
