import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../services/logout_service.dart';
import '../../services/preferences_service.dart';

part 'app_control_state.dart';

@injectable
class AppControlCubit extends Cubit<AppControlState> {
  final PreferencesService _preferencesService;
  final LogoutService _logoutService;

  AppControlCubit(
    this._preferencesService,
    this._logoutService,
    @factoryParam AppControlState? initialState,
  ) : super(initialState!);

  Future<void> setLocale(Locale locale) async {
    await _preferencesService.setLocale(locale);
    emit(state.copyWith(locale: locale));
  }

  Future<void> setAppTheme(ThemeMode theme) async {
    await _preferencesService.setAppTheme(theme);
    emit(state.copyWith(theme: theme));
  }

  Future<void> logout() async {
    await _logoutService.logout();
  }
}
