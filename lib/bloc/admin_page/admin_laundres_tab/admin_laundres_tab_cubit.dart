import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/laundry.dart';
import '../../../services/laundries_service.dart';
import '../../base_cubit.dart';

part 'admin_laundres_tab_state.dart';

@injectable
class AdminLaundriesTabCubit extends BaseCubit<AdminLaundriesTabState> {
  final LaundriesService _laundriesService;

  AdminLaundriesTabCubit(
    this._laundriesService,
  ) : super(const AdminLaundriesTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminLaundriesTabStatus.error,
    ));
  }

  Future<void> getSitters({int page = 0}) async {
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
}
