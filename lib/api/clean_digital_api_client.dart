import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/auth_meta.dart';
import 'api_constants.dart';
import 'models/auth/login_request.dart';
import 'models/auth/restore_password_request.dart';

part 'clean_digital_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.host)
abstract class CleanDigitalApiClient {
  factory CleanDigitalApiClient(
    Dio dio, {
    String baseUrl,
  }) = _CleanDigitalApiClient;

  ///
  /// Auth
  ///

  @POST('/auth/login')
  Future<AuthMeta> login(
    @Body() LoginRequest body,
  );

  @POST('/auth/forget')
  Future<void> restorePassword(
    @Body() RestorePasswordRequest body,
  );
}
