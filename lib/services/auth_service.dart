import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import '../api/models/auth/login_request.dart';
import '../api/models/auth/restore_password_request.dart';
import '../models/auth_meta.dart';
import 'base_service.dart';

@injectable
class AuthService extends BaseService {
  final CleanDigitalApiClient _apiClient;

  AuthService(this._apiClient);

  Future<AuthMeta> login(String email, String password) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.login(LoginRequest(
        email: email,
        password: password,
      ));
    });
  }

  Future<void> restorePassword(String email) async {
    await makeErrorHandledCall(() async {
      await _apiClient.restorePassword(RestorePasswordRequest(
        email: email,
      ));
    });
  }
}
