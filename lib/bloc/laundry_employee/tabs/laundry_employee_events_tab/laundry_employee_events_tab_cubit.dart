import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/event.dart';
import '../../../../services/laundries_service.dart';
import '../../../base_cubit.dart';

part 'laundry_employee_events_tab_state.dart';

@injectable
class LaundryEmployeeEventsTabCubit
    extends BaseCubit<LaundryEmployeeEventsTabState> {
  final LaundriesService _laundriesService;

  LaundryEmployeeEventsTabCubit(
    this._laundriesService,
  ) : super(const LaundryEmployeeEventsTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: LaundryEmployeeEventsTabStatus.error,
      errorMessage: errorMessage,
    ));
  }

  void reset() {
    emit(const LaundryEmployeeEventsTabState());
  }

  Future<void> getEvents({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: LaundryEmployeeEventsTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final events = await _laundriesService.getLaundryEvents(
        page: page,
      );
      emit(state.copyWith(
        status: LaundryEmployeeEventsTabStatus.success,
        totalPages: events.totalPages,
        events: events.events,
        totalElements: events.totalElements,
      ));
    });
  }
}
