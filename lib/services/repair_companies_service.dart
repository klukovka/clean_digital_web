import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import '../api/models/create_update_requests/create_repair_event.dart';
import '../api/models/create_update_requests/create_update_repair_company.dart';
import '../api/models/create_update_requests/create_update_repair_product.dart';
import '../models/pagination/repair_companies_pagination.dart';
import '../models/pagination/repair_products_pagination.dart';
import '../models/repair_company.dart';
import '../models/repair_event.dart';
import '../models/repair_product.dart';
import 'base_service.dart';

@injectable
class RepairCompaniesService extends BaseService {
  final CleanDigitalApiClient _apiClient;

  RepairCompaniesService(this._apiClient);

  Future<RepairCompaniesPagination> getAllRepairCompanies({
    int page = 0,
    int size = 10,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getRepairCompanies(page, size);
    });
  }

  Future<void> createRepairCompany(
    CreateUpdateRepairCompanyRequest request,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.createRepairCompany(request);
    });
  }

  Future<List<RepairProduct>> getCompanyProducts(
    String repairCompanyId,
  ) async {
    return await makeErrorHandledCall(() async {
      return (await _apiClient.getCompanyProducts(repairCompanyId)).products;
    });
  }

  Future<List<RepairEvent>> getLaundryRepairEvents() async {
    return await makeErrorHandledCall(() async {
      return (await _apiClient.getLaundryRepairEvents()).repairEvents;
    });
  }

  Future<RepairProductsPagination> getAllProducts({
    int page = 0,
    int size = 10,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getAllProducts(page, size);
    });
  }

  Future<void> createRepairEvent(
    CreateRepairEventRequest request,
  ) async {
    await makeErrorHandledCall(() async {
      await _apiClient.createRepairEvent(request);
    });
  }

  Future<void> doneEvent(String repairEventI) async {
    await makeErrorHandledCall(() async {
      await _apiClient.doneEvent(repairEventI);
    });
  }

  Future<RepairCompany> getRepairCompanyInfo() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getRepairCompanyInfo();
    });
  }

  Future<void> updateRepairCompany(
    CreateUpdateRepairCompanyRequest request,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.updateRepairCompany(request);
    });
  }

  Future<RepairProductsPagination> getCompanyOwnProducts() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getCompanyOwnProducts();
    });
  }

  Future<void> createRepairProduct(
    CreateUpdateRepairProductRequest request,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.createRepairProduct(request);
    });
  }

  Future<void> updateRepairProduct(
    String repairProductId,
    CreateUpdateRepairProductRequest request,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.updateRepairProduct(repairProductId, request);
    });
  }

  Future<void> deleteRepairProduct(
    String repairProductId,
  ) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.deleteRepairProduct(repairProductId);
    });
  }
}
