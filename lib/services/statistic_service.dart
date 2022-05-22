import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import '../models/pagination/payment_pagination.dart';
import '../models/pagination/rating_pagination.dart';
import '../models/pagination/repair_pagination.dart';
import '../models/pagination/time_and_usage_pagination.dart';
import '../models/statistic/payment_statistic_laundry.dart';
import '../models/statistic/rating_statistic_laundry.dart';
import '../models/statistic/repair_statistic_laundry.dart';
import '../models/statistic/time_and_usage_laundry.dart';
import 'base_service.dart';

@injectable
class StatisticService extends BaseService {
  final CleanDigitalApiClient _apiClient;

  StatisticService(this._apiClient);

  Future<RatingPagination> getAllRating({
    int page = 0,
    int size = 5,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getAllRating(page, size);
    });
  }

  Future<PaymentPagination> getAllPayment({
    int page = 0,
    int size = 5,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getAllPayment(page, size);
    });
  }

  Future<TimeAndUsagePagination> getAllTimeAndUsage({
    int page = 0,
    int size = 5,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getAllTimeAndUsage(page, size);
    });
  }

  Future<RepairPagination> getAllRepair({
    int page = 0,
    int size = 5,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getAllRepair(page, size);
    });
  }

  Future<RatingStatisticLaundry> getLaundryRating() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryRating();
    });
  }

  Future<PaymentStatisticLaundry> getLaundryPayment() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryPayment();
    });
  }

  Future<TimeAndUsageStatisticLaundry> getLaundryTimeAndUsage() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryTimeAndUsage();
    });
  }

  Future<RepairStatisticLaundry> getLaundryRepair() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryRepair();
    });
  }
}
