import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import '../models/pagination/all_laundries_statistic_pagination.dart';
import '../models/statistic/all_laundry_statistic.dart';
import 'base_service.dart';

@injectable
class StatisticService extends BaseService {
  final CleanDigitalApiClient _apiClient;

  StatisticService(this._apiClient);

  Future<AllLaundryStatisticPagination> getAllStatistic({
    int page = 0,
    int size = 5,
  }) async {
    return await makeErrorHandledCall(() async {
      final rating = await _apiClient.getAllRating(page, size);
      log(rating.toString());
      final payment = await _apiClient.getAllPayment(page, size);
      log(payment.toString());
      final timeAndUsage = await _apiClient.getAllTimeAndUsage(page, size);
      log(timeAndUsage.toString());
      final repair = await _apiClient.getAllRepair(page, size);
      log(repair.toString());

      List<AllLaundryStatistic> statistic = [];

      for (int i = 0; i < rating.rating.length; i++) {
        statistic.add(AllLaundryStatistic(
          laundry: rating.rating[i].laundry,
          laundryPaymentValue: payment.payment[i].laundryValue,
          washMachinePaymentValue: payment.payment[i].washMachineValue,
          laundryRatingValue: rating.rating[i].laundryValue,
          washMachineRatingValue: rating.rating[i].washMachineValue,
          laundryRepairValue: repair.repair[i].laundryValue,
          washMachineRepairValue: repair.repair[i].washMachineValue,
          laundryTimeAndUsageValue: timeAndUsage.timeAndUsage[i].laundryValue,
          washMachineTimeAndUsageValue:
              timeAndUsage.timeAndUsage[i].washMachineValue,
        ));
      }

      return AllLaundryStatisticPagination(
        statistic: statistic,
        page: rating.page,
        size: rating.size,
        totalElements: rating.totalElements,
        totalPages: rating.totalPages,
      );
    });
  }

  Future<AllLaundryStatistic> getLaundryStatistic() async {
    return await makeErrorHandledCall(() async {
      final rating = await _apiClient.getLaundryRating();
      final payment = await _apiClient.getLaundryPayment();
      final timeAndUsage = await _apiClient.getLaundryTimeAndUsage();
      final repair = await _apiClient.getLaundryRepair();

      return AllLaundryStatistic(
        laundry: rating.laundry,
        laundryPaymentValue: payment.laundryValue,
        washMachinePaymentValue: payment.washMachineValue,
        laundryRatingValue: rating.laundryValue,
        washMachineRatingValue: rating.washMachineValue,
        laundryRepairValue: repair.laundryValue,
        washMachineRepairValue: repair.washMachineValue,
        laundryTimeAndUsageValue: timeAndUsage.laundryValue,
        washMachineTimeAndUsageValue: timeAndUsage.washMachineValue,
      );
    });
  }
}
