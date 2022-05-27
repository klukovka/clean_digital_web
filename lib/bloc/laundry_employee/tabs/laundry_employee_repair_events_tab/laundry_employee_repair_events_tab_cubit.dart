import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../api/models/create_update_requests/create_repair_event.dart';
import '../../../../models/repair_event.dart';
import '../../../../services/repair_companies_service.dart';
import '../../../base_cubit.dart';

part 'laundry_employee_repair_events_tab_state.dart';

@injectable
class RepairEventsTabCubit extends BaseCubit<RepairEventsTabState> {
  final RepairCompaniesService _repairCompaniesService;

  RepairEventsTabCubit(
    this._repairCompaniesService,
  ) : super(const RepairEventsTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: RepairEventsTabStatus.error,
    ));
  }

  void reset() {
    emit(const RepairEventsTabState());
  }

  Future<void> getRepairEvents() async {
    emit(state.copyWith(status: RepairEventsTabStatus.loading));
    await makeErrorHandledCall(() async {
      final repairEvents =
          await _repairCompaniesService.getLaundryRepairEvents();
      emit(state.copyWith(
        status: RepairEventsTabStatus.success,
        repairEvents: repairEvents,
        totalElements: repairEvents.length,
      ));
    });
  }

  Future<void> createRepairEvent(
    CreateRepairEventRequest request,
  ) async {
    emit(state.copyWith(
      status: RepairEventsTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _repairCompaniesService.createRepairEvent(request);
    });
    reset();
  }
}
