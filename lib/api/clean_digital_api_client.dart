import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/auth_meta.dart';
import '../models/laundry.dart';
import '../models/pagination/laundries_pagination.dart';
import '../models/user.dart';
import 'api_constants.dart';
import 'models/auth/login_request.dart';
import 'models/auth/restore_password_request.dart';
import 'models/auth/update_password_request.dart';
import 'models/backup.dart';
import 'models/create_update_requests/create_update_laundry.dart';

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

  @GET('/auth/info')
  Future<User> getUser();

  @POST('/auth/signup-admin')
  Future<void> createAdmin(
    @Body() LoginRequest body,
  );

  @POST('/auth/signup-laundry')
  Future<void> createLaundry(
    @Body() CreateUpdateLaundryRequest body,
  );

  @POST('/auth/signup-iot')
  Future<void> createIOT(
    @Body() LoginRequest body,
  );

  @PATCH('/auth/update-password')
  Future<void> updatePassword(
    @Body() UpdatePasswordRequest body,
  );

  @DELETE('/auth/delete-account')
  Future<void> deleteAccount();

  ///
  /// Laundries
  ///

  @GET('/laundry/all')
  Future<LaundriesPagination> getLaundries(
    @Query('page') int page,
    @Query('size') int size,
  );

  ///
  /// Backup
  ///

  @GET('/dataFlow/all')
  Future<Backup> getAllBackups();

  @GET('/dataFlow/backup')
  Future<void> backup();

  @POST('/dataFlow/restore/{backupId}')
  Future<void> restore(
    @Path() String backupId,
  );
}
