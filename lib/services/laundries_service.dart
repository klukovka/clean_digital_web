import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import '../api/models/create_update_requests/create_update_employee.dart';
import '../api/models/create_update_requests/create_update_laundry.dart';
import '../api/models/create_update_requests/create_update_mode.dart';
import '../api/models/create_update_requests/create_update_wash_machine.dart';
import '../models/employee.dart';
import '../models/laundry.dart';
import '../models/pagination/additional_modes_pagination.dart';
import '../models/pagination/employees_pagination.dart';
import '../models/pagination/event_pagination.dart';
import '../models/pagination/laundries_pagination.dart';
import '../models/pagination/modes_pagination.dart';
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

  Future<Laundry> getLaundryPersonalInfo() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryPersonalInfo();
    });
  }

  Future<void> updateLaundry(CreateUpdateLaundryRequest request) async {
    return await makeErrorHandledCall(() async {
      return _apiClient.updateLaundry(request);
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

  ///
  /// Employees
  ///

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

  Future<EmployeesPagination> getLaundryOwnEmployees({
    int page = 0,
    int size = 10,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryOwnEmployees(page, size);
    });
  }

  Future<void> createEmployee(
    CreateUpdateEmployeeRequest body,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.createEmployee(body);
    });
  }

  Future<void> deleteEmployee(String userId) async {
    await makeErrorHandledCall(() async {
      await _apiClient.deleteEmployee(userId);
    });
  }

  Future<Employee> getEmployeePersonalInfo() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getEmployeePersonalInfo();
    });
  }

  Future<void> updateEmployee(
    CreateUpdateEmployeeRequest request,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.updateEmployee(request);
    });
  }

  ///
  /// Additional Modes
  ///

  Future<void> createAdditionalMode(
    CreateUpdateModeRequest request,
  ) async {
    await makeErrorHandledCall(() async {
      await _apiClient.createAdditionalMode(request);
    });
  }

  Future<void> updateAdditionalMode(
    String additionalModeId,
    CreateUpdateModeRequest request,
  ) async {
    await makeErrorHandledCall(() async {
      await _apiClient.updateAdditionalMode(additionalModeId, request);
    });
  }

  Future<void> deleteAdditionalMode(
    String additionalModeId,
  ) async {
    await makeErrorHandledCall(() async {
      await _apiClient.deleteAdditionalMode(additionalModeId);
    });
  }

  Future<AdditionalModesPagination> getAllAdditionalModes() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getAllAdditionalModes();
    });
  }

  ///
  /// Modes
  ///

  Future<void> createMode(
    CreateUpdateModeRequest request,
  ) async {
    await makeErrorHandledCall(() async {
      await _apiClient.createMode(request);
    });
  }

  Future<void> updateMode(
    String modeId,
    CreateUpdateModeRequest request,
  ) async {
    await makeErrorHandledCall(() async {
      await _apiClient.updateMode(modeId, request);
    });
  }

  Future<void> deleteMode(
    String modeId,
  ) async {
    await makeErrorHandledCall(() async {
      await _apiClient.deleteMode(modeId);
    });
  }

  Future<ModesPagination> getAllModes() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getAllModes();
    });
  }

  ///
  /// Events
  ///

  Future<EventsPagination> getLaundryEvents({
    int page = 0,
    int size = 10,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundryEvents(page, size);
    });
  }
}
