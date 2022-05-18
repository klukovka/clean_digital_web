import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/user.dart';
import '../../../../services/auth_service.dart';
import '../../../base_cubit.dart';

part 'admin_settings_tab_state.dart';

@injectable
class AdminSettingsTabCubit extends BaseCubit<AdminSettingsTabState> {
  final AuthService _authService;

  AdminSettingsTabCubit(this._authService)
      : super(const AdminSettingsTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminSettingsTabStatus.error,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(status: AdminSettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      final user = await _authService.getUser();
      emit(state.copyWith(
        status: AdminSettingsTabStatus.success,
        user: user,
      ));
    });
  }

  Future<void> delete() async {
    emit(state.copyWith(status: AdminSettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.deleteAccount();
      emit(state.copyWith(status: AdminSettingsTabStatus.deleted));
    });
  }

  Future<void> updatePassword(String password, String newPassword) async {
    emit(state.copyWith(status: AdminSettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.updatePassword(newPassword, password);
      await init();
    });
  }

  Future<void> registerAdmin(String email, String password) async {
    emit(state.copyWith(status: AdminSettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.createAdmin(email, password);
      await init();
    });
  }
}
