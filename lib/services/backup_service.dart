import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import 'base_service.dart';

@injectable
class BackupService extends BaseService {
  final CleanDigitalApiClient _apiClient;

  BackupService(this._apiClient);

  Future<List<String>> getAllBackups() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getAllBackups();
    });
  }

  Future<void> backup() async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.backup();
    });
  }

  Future<void> restore(String backupId) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.restore(backupId);
    });
  }
}
