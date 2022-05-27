import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/wash_machine.dart';
import '../../../../services/laundries_service.dart';
import '../../base_cubit.dart';

part 'choose_wash_machines_page_state.dart';

@injectable
class ChooseWashMachinesPageCubit
    extends BaseCubit<ChooseWashMachinesPageState> {
  final LaundriesService _laundriesService;

  ChooseWashMachinesPageCubit(
    this._laundriesService,
  ) : super(const ChooseWashMachinesPageState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: ChooseWashMachinesPageStatus.error,
      errorMessage: errorMessage,
    ));
  }

  void reset() {
    emit(const ChooseWashMachinesPageState());
  }

  Future<void> getWashMachines({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: ChooseWashMachinesPageStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final washMachines = await _laundriesService.getLaundryOwnWashMachines(
        page: page,
      );
      emit(state.copyWith(
        status: ChooseWashMachinesPageStatus.success,
        totalPages: washMachines.totalPages,
        washMachines: washMachines.washMachines,
        totalElements: washMachines.totalElements,
      ));
    });
  }
}
