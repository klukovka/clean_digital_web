import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../models/role.dart';
import '../../services/preferences_service.dart';
import '../base_cubit.dart';

part 'splash_page_state.dart';

@injectable
class SplashPageCubit extends BaseCubit<SplashPageState> {
  final PreferencesService _preferencesService;

  SplashPageCubit(
    this._preferencesService,
  ) : super(const SplashPageState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: SplashPageStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> tryLogIn() async {
    emit(state.copyWith(status: SplashPageStatus.loading));

    await makeErrorHandledCall(() async {
      if (_preferencesService.isLoggedIn) {
        emit(state.copyWith(
          status: SplashPageStatus.authorized,
          role: _preferencesService.getRole(),
        ));
        return;
      }

      emit(state.copyWith(status: SplashPageStatus.unauthorized));
    });
  }
}
