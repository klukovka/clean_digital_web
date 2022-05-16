import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/clean_digital_localizations.dart';
import '../models/auth_meta.dart';
import '../models/role.dart';
import '../utils/extensions/theme_mode_ext.dart';

@injectable
@preResolve
class PreferencesService {
  static const _accessTokenKey = '_accessTokenKey';
  static const _userIdKey = '_userIdKey';
  static const _emailKey = '_emailKey';
  static const _idKey = '_idKey';
  static const _roleKey = '_roleKey';
  static const _localeKey = '_localeKey';
  static const _themeKey = '_themeKey';

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

  String getUserId() => _preferences.getString(_userIdKey) ?? '';

  Future<void> setUserId(String userId) async {
    await _preferences.setString(_userIdKey, userId);
  }

  String getEmail() => _preferences.getString(_emailKey) ?? '';

  Future<void> setEmail(String email) async {
    await _preferences.setString(_emailKey, email);
  }

  String getId() => _preferences.getString(_idKey) ?? '';

  Future<void> setId(String id) async {
    await _preferences.setString(_idKey, id);
  }

  Role getRole() {
    final role = _preferences.getString(_roleKey) ?? '';
    if (role == Role.admin.name) return Role.admin;
    if (role == Role.laundry.name) return Role.laundry;
    if (role == Role.employee.name) return Role.employee;
    if (role == Role.client.name) return Role.client;
    if (role == Role.iot.name) return Role.iot;
    if (role == Role.repairCompany.name) return Role.repairCompany;

    return Role.iot;
  }

  Future<void> setRole(Role role) async {
    await _preferences.setString(_roleKey, role.name);
  }

  Future<void> setAuthDetails(AuthMeta details) async {
    await setAccessToken(details.token);
    await setUserId(details.userId);
    await setEmail(details.email);
    await setId(details.id);
    await setRole(details.role);
  }

  Future<void> logout() async {
    await _preferences.remove(_accessTokenKey);
    await _preferences.remove(_userIdKey);
    await _preferences.remove(_emailKey);
    await _preferences.remove(_idKey);
    await _preferences.remove(_roleKey);
  }
}
