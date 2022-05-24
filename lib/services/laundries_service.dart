import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import '../api/models/create_update_requests/create_update_laundry.dart';
import '../api/models/create_update_requests/create_update_wash_machine.dart';
import '../models/laundry.dart';
import '../models/pagination/employees_pagination.dart';
import '../models/pagination/laundries_pagination.dart';
import '../models/pagination/wash_machines_pagination.dart';
import 'base_service.dart';

@injectable
class LaundriesService extends BaseService {
  final CleanDigitalApiClient _apiClient;

  LaundriesService(this._apiClient);

  ///
  /// Laundries
  ///

  Future<LaundriesPagination> getAllLaundries({
    int page = 0,
    int size = 10,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundries(page, size);
    });
  }

  Future<void> createLaundry(
    CreateUpdateLaundryRequest request,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.createLaundry(request);
    });
  }

  Future<Laundry> getLaundryById(String laundryId) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryById(laundryId);
    });
  }

  Future<EmployeesPagination> getLaundryEmployees({
    required String laundryId,
    int page = 0,
    int size = 10,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryEmployees(
        laundryId,
        page,
        size,
      );
    });
  }

  ///
  /// Washing machines
  ///

  Future<WashMachinesPagination> getLaundryWashMachines({
    required String laundryId,
    int page = 0,
    int size = 10,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryWashMachines(
        laundryId,
        page,
        size,
      );
    });
  }

  Future<WashMachinesPagination> getLaundryOwnWashMachines({
    int page = 0,
    int size = 10,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryOwnWashMachines(
        page,
        size,
      );
    });
  }

  Future<void> createWashMachine(
    CreateUpdateWashMachineRequest body,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.createWashMachine(body);
    });
  }

  Future<void> updateWashMachine(
    String washMachineId,
    CreateUpdateWashMachineRequest body,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.updateWashMachine(washMachineId, body);
    });
  }

  Future<void> deleteWashMachine(
    String washMachineId,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.deleteWashMachine(washMachineId);
    });
  }
}
