import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/statistic/all_laundry_statistic.dart';
import '../../../../services/statistic_service.dart';
import '../../../base_cubit.dart';

part 'admin_statistic_tab_state.dart';

@injectable
class AdminStatisticTabCubit extends BaseCubit<AdminStatisticTabState> {
  final StatisticService _statisticService;

  AdminStatisticTabCubit(
    this._statisticService,
  ) : super(const AdminStatisticTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminStatisticTabStatus.error,
    ));
  }

  void reset() {
    emit(const AdminStatisticTabState());
  }

  Future<void> getStatistic({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: AdminStatisticTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final statistic = await _statisticService.getAllStatistic(page: page);

      emit(state.copyWith(
        status: AdminStatisticTabStatus.success,
        totalPages: statistic.totalPages,
        totalElements: statistic.totalElements,
        statistic: statistic.statistic,
      ));
    });
  }
}
