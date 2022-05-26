import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/laundry.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/laundries_service.dart';
import '../../../base_cubit.dart';

part 'laundry_settings_tab_state.dart';

@injectable
class LaundrySettingsTabCubit extends BaseCubit<LaundrySettingsTabState> {
  final LaundriesService _laundriesService;
  final AuthService _authService;

  LaundrySettingsTabCubit(
    this._laundriesService,
    this._authService,
  ) : super(const LaundrySettingsTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: LaundrySettingsTabStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(status: LaundrySettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      final laundry = await _laundriesService.getLaundryPersonalInfo();
      emit(state.copyWith(
        status: LaundrySettingsTabStatus.success,
        laundry: laundry,
      ));
    });
  }

  Future<void> delete() async {
    emit(state.copyWith(status: LaundrySettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.deleteAccount();
      emit(state.copyWith(status: LaundrySettingsTabStatus.deleted));
    });
  }

  Future<void> updatePassword(String password, String newPassword) async {
    emit(state.copyWith(status: LaundrySettingsTabStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.updatePassword(newPassword, password);
      await init();
    });
  }
}
