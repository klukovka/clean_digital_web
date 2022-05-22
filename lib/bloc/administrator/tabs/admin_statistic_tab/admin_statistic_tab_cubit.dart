import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/statistic/payment_statistic_laundry.dart';
import '../../../../models/statistic/rating_statistic_laundry.dart';
import '../../../../models/statistic/repair_statistic_laundry.dart';
import '../../../../models/statistic/time_and_usage_laundry.dart';
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

  Future<void> getStatistic({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: AdminStatisticTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final rating = await _statisticService.getAllRating(page: page);
      final payment = await _statisticService.getAllPayment(page: page);
      final timeAndUsage = await _statisticService.getAllTimeAndUsage(
        page: page,
      );
      final repair = await _statisticService.getAllRepair(page: page);

      emit(state.copyWith(
        status: AdminStatisticTabStatus.success,
        totalPages: rating.totalPages,
        totalElements: rating.totalElements,
        rating: rating.rating,
        payment: payment.payment,
        timeAndUsage: timeAndUsage.timeAndUsage,
        repair: repair.repair,
      ));
    });
  }
}
