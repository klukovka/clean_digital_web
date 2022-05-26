import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/statistic/all_laundry_statistic.dart';
import '../../../services/statistic_service.dart';
import '../../base_cubit.dart';

part 'laundry_employee_statistic_tab_state.dart';

@injectable
class LaundryEmployeeStatisticTabCubit
    extends BaseCubit<LaundryEmployeeStatisticTabState> {
  final StatisticService _statisticService;

  LaundryEmployeeStatisticTabCubit(
    this._statisticService,
  ) : super(const LaundryEmployeeStatisticTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: LaundryEmployeeStatisticTabStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(status: LaundryEmployeeStatisticTabStatus.loading));

    await makeErrorHandledCall(() async {
      emit(state.copyWith(
        status: LaundryEmployeeStatisticTabStatus.success,
        statistic: await _statisticService.getLaundryStatistic(),
      ));
    });
  }
}
