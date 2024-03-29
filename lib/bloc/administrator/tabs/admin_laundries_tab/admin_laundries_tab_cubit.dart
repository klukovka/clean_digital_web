import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../api/models/create_update_requests/create_update_laundry.dart';
import '../../../../models/laundry.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/laundries_service.dart';
import '../../../base_cubit.dart';

part 'admin_laundries_tab_state.dart';

@injectable
class AdminLaundriesTabCubit extends BaseCubit<AdminLaundriesTabState> {
  final LaundriesService _laundriesService;
  final AuthService _authService;

  AdminLaundriesTabCubit(
    this._laundriesService,
    this._authService,
  ) : super(const AdminLaundriesTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminLaundriesTabStatus.error,
    ));
  }

  void reset() {
    emit(const AdminLaundriesTabState());
  }

  Future<void> getLaundries({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: AdminLaundriesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final laundries = await _laundriesService.getAllLaundries(
        page: page,
      );
      emit(state.copyWith(
        status: AdminLaundriesTabStatus.success,
        totalPages: laundries.totalPages,
        laundries: laundries.laundries,
        totalElements: laundries.totalElements,
      ));
    });
  }

  Future<void> createLaundry(CreateUpdateLaundryRequest request) async {
    emit(state.copyWith(status: AdminLaundriesTabStatus.loading));
    await makeErrorHandledCall(() async {
      await _laundriesService.createLaundry(request);
    });
    reset();
  }

  Future<void> deteleLaundry(String userId) async {
    emit(state.copyWith(status: AdminLaundriesTabStatus.loading));
    await makeErrorHandledCall(() async {
      await _authService.deleteUser(userId);
    });
    reset();
  }
}
