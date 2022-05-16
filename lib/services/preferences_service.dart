import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/clean_digital_localizations.dart';
import '../utils/extensions/theme_mode_ext.dart';

@injectable
@preResolve
class PreferencesService {
  static const _accessTokenKey = '_accessTokenKey';
  static const _localeKey = '_localeKey';
  static const _themeKey = '_localeKey';

  final SharedPreferences _preferences;

  PreferencesService._(this._preferences);

  @factoryMethod
  static Future<PreferencesService> getInstance() async {
    final preferences = await SharedPreferences.getInstance();
    return PreferencesService._(preferences);
  }

  /// Localizations

  Future<CleanDigitalLocalizations> getLocalizations() async {
    return await CleanDigitalLocalizations.delegate.load(
      getLocale(),
    );
  }

  String getDefaultLanguageCode() {
    return CleanDigitalLocalizations.supportedLocales.first.languageCode;
  }

  Locale getLocale() {
    final languageCode =
        _preferences.getString(_localeKey) ?? getDefaultLanguageCode();
    return Locale(languageCode);
  }

  Future<void> setLocale(Locale locale) async {
    await _preferences.setString(_localeKey, locale.languageCode);
  }

  /// Theme

  ThemeMode getAppTheme() {
    final theme = _preferences.getString(_themeKey) ?? ThemeMode.system.name;
    return ThemeModeExt.getTheme(theme);
  }

  Future<void> setAppTheme(ThemeMode theme) async {
    await _preferences.setString(_themeKey, theme.name);
  }

  /// Auth

  bool get hasToken => getAccessToken().isNotEmpty;

  bool get isTokenExpired {
    final token = getAccessToken();

    if (token.isEmpty) return true;

    return Jwt.isExpired(token);
  }

  bool get isLoggedIn => hasToken && !isTokenExpired;

  String getAccessToken() => _preferences.getString(_accessTokenKey) ?? '';

  Future<void> setAccessToken(String accessToken) async {
    await _preferences.setString(_accessTokenKey, accessToken);
  }

  // Future<void> setAuthDetails(AuthMeta details) async {
  //   await setAccessToken(details.jwtToken);
  //   await setRefreshToken(details.refreshToken);
  //   await setUserId(details.userId);
  // }

  // Future<void> logout() async {
  //   await _preferences.remove(_accessTokenKey);
  //   await _preferences.remove(_refreshTokenKey);
  //   await _preferences.remove(_userIdKey);
  // }
}
