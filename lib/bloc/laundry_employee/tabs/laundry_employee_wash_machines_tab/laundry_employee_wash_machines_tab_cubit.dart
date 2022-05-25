import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../api/models/create_update_requests/create_update_wash_machine.dart';
import '../../../../models/wash_machine.dart';
import '../../../../services/laundries_service.dart';
import '../../../base_cubit.dart';

part 'laundry_employee_wash_machines_tab_state.dart';

@injectable
class LaundryEmployeeWashMachinesTabCubit
    extends BaseCubit<LaundryEmployeeWashMachinesTabState> {
  final LaundriesService _laundriesService;

  LaundryEmployeeWashMachinesTabCubit(
    this._laundriesService,
  ) : super(const LaundryEmployeeWashMachinesTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: LaundryEmployeeWashMachinesTabStatus.error,
      errorMessage: errorMessage,
    ));
  }

  void reset() {
    emit(const LaundryEmployeeWashMachinesTabState());
  }

  Future<void> getWashMachines({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: LaundryEmployeeWashMachinesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final washMachines = await _laundriesService.getLaundryOwnWashMachines(
        page: page,
      );
      emit(state.copyWith(
        status: LaundryEmployeeWashMachinesTabStatus.success,
        totalPages: washMachines.totalPages,
        washMachines: washMachines.washMachines,
        totalElements: washMachines.totalElements,
      ));
    });
  }

  Future<void> createWashMachine(
    CreateUpdateWashMachineRequest washMachine,
  ) async {
    emit(state.copyWith(
      status: LaundryEmployeeWashMachinesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.createWashMachine(washMachine);
    });
    reset();
  }

  Future<void> updateWashMachine(
    String washMachineId,
    CreateUpdateWashMachineRequest washMachine,
  ) async {
    emit(state.copyWith(
      status: LaundryEmployeeWashMachinesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.updateWashMachine(washMachineId, washMachine);
    });
    reset();
  }

  Future<void> deleteWashMachine(
    String washMachineId,
  ) async {
    emit(state.copyWith(
      status: LaundryEmployeeWashMachinesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _laundriesService.deleteWashMachine(washMachineId);
    });
    reset();
  }
}
