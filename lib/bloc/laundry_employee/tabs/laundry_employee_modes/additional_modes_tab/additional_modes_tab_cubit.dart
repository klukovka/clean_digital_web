import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../api/models/create_update_requests/create_update_mode.dart';
import '../../../../../models/additional_mode.dart';
import '../../../../../services/laundries_service.dart';
import '../../../../base_cubit.dart';

part 'additional_modes_tab_state.dart';

@injectable
class AdditionalModesTabCubit extends BaseCubit<AdditionalModesTabState> {
  final LaundriesService _laundriesService;

  AdditionalModesTabCubit(
    this._laundriesService,
  ) : super(const AdditionalModesTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdditionalModesTabStatus.error,
    ));
  }

  Future<void> getAdditionalModes() async {
    emit(state.copyWith(status: AdditionalModesTabStatus.loading));
    await makeErrorHandledCall(() async {
      final additionalModes = await _laundriesService.getAllAdditionalModes();
      emit(state.copyWith(
        status: AdditionalModesTabStatus.success,
        additionalModes: additionalModes.additionalModes,
        totalElements: additionalModes.totalElements,
      ));
    });
  }

  Future<void> createAdditionalMode(
    CreateUpdateModeRequest request,
  ) async {
    emit(state.copyWith(
      status: AdditionalModesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.createAdditionalMode(request);
    });
    getAdditionalModes();
  }

  Future<void> updateAdditionalMode(
    String additionalModeId,
    CreateUpdateModeRequest request,
  ) async {
    emit(state.copyWith(
      status: AdditionalModesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.updateAdditionalMode(
        additionalModeId,
        request,
      );
    });
    getAdditionalModes();
  }

  Future<void> deleteAdditionalMode(String additionalModeId) async {
    emit(state.copyWith(
      status: AdditionalModesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.deleteAdditionalMode(additionalModeId);
    });
    getAdditionalModes();
  }
}
