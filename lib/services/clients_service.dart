import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import '../models/pagination/clients_pagination.dart';
import 'base_service.dart';

@injectable
class ClientsService extends BaseService {
  final CleanDigitalApiClient _apiClient;

  ClientsService(this._apiClient);

  Future<ClientsPagination> getAllClients({
    int page = 0,
    int size = 10,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getClients(page, size);
    });
  }
}
