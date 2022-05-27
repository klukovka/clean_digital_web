import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../api/models/create_update_requests/create_repair_event.dart';
import '../../../../models/repair_event.dart';
import '../../../../services/repair_companies_service.dart';
import '../../../base_cubit.dart';

part 'laundry_employee_repair_events_tab_state.dart';

@injectable
class LaundryEmployeeRepairEventsTabCubit
    extends BaseCubit<LaundryEmployeeRepairEventsTabState> {
  final RepairCompaniesService _repairCompaniesService;

  LaundryEmployeeRepairEventsTabCubit(
    this._repairCompaniesService,
  ) : super(const LaundryEmployeeRepairEventsTabState());

  get getAdditionalModes => null;

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: LaundryEmployeeRepairEventsTabStatus.error,
    ));
  }

  void reset() {
    emit(const LaundryEmployeeRepairEventsTabState());
  }

  Future<void> getRepairEvents() async {
    emit(state.copyWith(status: LaundryEmployeeRepairEventsTabStatus.loading));
    await makeErrorHandledCall(() async {
      final repairEvents =
          await _repairCompaniesService.getLaundryRepairEvents();
      emit(state.copyWith(
        status: LaundryEmployeeRepairEventsTabStatus.success,
        repairEvents: repairEvents,
        totalElements: repairEvents.length,
      ));
    });
  }

  Future<void> createRepairEvent(
    CreateRepairEventRequest request,
  ) async {
    emit(state.copyWith(
      status: LaundryEmployeeRepairEventsTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _repairCompaniesService.createRepairEvent(request);
    });
    reset();
  }
}
