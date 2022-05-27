import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/repair_event.dart';
import '../../../services/repair_companies_service.dart';
import '../../base_cubit.dart';

part 'repair_events_tab_state.dart';

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

  Future<void> getRepairEvents() async {
    emit(state.copyWith(status: RepairEventsTabStatus.loading));
    await makeErrorHandledCall(() async {
      final repairEvents =
          await _repairCompaniesService.getCompanyRepairEvents();
      emit(state.copyWith(
        status: RepairEventsTabStatus.success,
        repairEvents: repairEvents,
        totalElements: repairEvents.length,
      ));
    });
  }

  Future<void> doneRepairEvent(String repairEventId) async {
    emit(state.copyWith(
      status: RepairEventsTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      await _repairCompaniesService.doneEvent(repairEventId);
    });

    await getRepairEvents();
  }
}
