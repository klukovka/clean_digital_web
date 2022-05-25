import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../api/models/create_update_requests/create_update_mode.dart';
import '../../../../../models/mode.dart';
import '../../../../../services/laundries_service.dart';
import '../../../../base_cubit.dart';

part 'mode_tab_state.dart';

@injectable
class ModesTabCubit extends BaseCubit<ModesTabState> {
  final LaundriesService _laundriesService;

  ModesTabCubit(
    this._laundriesService,
  ) : super(const ModesTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: ModesTabStatus.error,
    ));
  }

  void reset() {
    emit(const ModesTabState());
  }

  Future<void> getModes() async {
    emit(state.copyWith(status: ModesTabStatus.loading));
    await makeErrorHandledCall(() async {
      final modes = await _laundriesService.getAllModes();
      emit(state.copyWith(
        status: ModesTabStatus.success,
        modes: modes.modes,
        totalElements: modes.totalElements,
      ));
    });
  }

  Future<void> createMode(
    CreateUpdateModeRequest request,
  ) async {
    emit(state.copyWith(
      status: ModesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.createMode(request);
    });
    reset();
  }

  Future<void> updateMode(
    String modeId,
    CreateUpdateModeRequest request,
  ) async {
    emit(state.copyWith(
      status: ModesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.updateMode(
        modeId,
        request,
      );
    });
    reset();
  }

  Future<void> deleteMode(String modeId) async {
    emit(state.copyWith(
      status: ModesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.deleteMode(modeId);
    });
    reset();
  }
}
