import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import '../api/models/auth/login_request.dart';
import '../api/models/auth/restore_password_request.dart';
import '../api/models/auth/update_password_request.dart';
import '../models/auth_meta.dart';
import '../models/user.dart';
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

  Future<void> deleteUser(String userId) async {
    await makeErrorHandledCall(() async {
      await _apiClient.deleteUser(userId);
    });
  }

  Future<User> getUser() async {
    return makeErrorHandledCall(() async {
      return await _apiClient.getUser();
    });
  }

  Future<void> createAdmin(String email, String password) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.createAdmin(LoginRequest(
        email: email,
        password: password,
      ));
    });
  }

  Future<void> createIOT(String email, String password) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.createIOT(LoginRequest(
        email: email,
        password: password,
      ));
    });
  }

  Future<void> updatePassword(String newPassword, String password) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.updatePassword(UpdatePasswordRequest(
        newPassword: newPassword,
        password: password,
      ));
    });
  }

  Future<void> deleteAccount() async {
    return makeErrorHandledCall(() async {
      return await _apiClient.deleteAccount();
    });
  }
}
