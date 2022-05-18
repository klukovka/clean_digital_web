import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import '../api/models/create_update_requests/create_update_repair_company.dart';
import '../models/pagination/repair_companies_pagination.dart';
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
}
