import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/auth_meta.dart';
import '../models/laundry.dart';
import '../models/pagination/clients_pagination.dart';
import '../models/pagination/employees_pagination.dart';
import '../models/pagination/laundries_pagination.dart';
import '../models/pagination/payment_pagination.dart';
import '../models/pagination/rating_pagination.dart';
import '../models/pagination/repair_companies_pagination.dart';
import '../models/pagination/repair_pagination.dart';
import '../models/pagination/time_and_usage_pagination.dart';
import '../models/pagination/wash_machines_pagination.dart';
import '../models/statistic/payment_statistic_laundry.dart';
import '../models/statistic/rating_statistic_laundry.dart';
import '../models/statistic/repair_statistic_laundry.dart';
import '../models/statistic/time_and_usage_laundry.dart';
import '../models/user.dart';
import 'api_constants.dart';
import 'models/auth/login_request.dart';
import 'models/auth/restore_password_request.dart';
import 'models/auth/update_password_request.dart';
import 'models/backup.dart';
import 'models/create_update_requests/create_update_laundry.dart';
import 'models/create_update_requests/create_update_repair_company.dart';

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

  @POST('/auth/signup-repair-company')
  Future<void> createRepairCompany(
    @Body() CreateUpdateRepairCompanyRequest body,
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

  @DELETE('/auth/admin-delete/{userId}')
  Future<void> deleteUser(
    @Path() String userId,
  );

  ///
  /// Laundries
  ///

  @GET('/laundry/all')
  Future<LaundriesPagination> getLaundries(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/laundry/{laundryId}')
  Future<Laundry> getLaundryById(
    @Path() String laundryId,
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

  ///
  /// Repair Companies
  ///

  @GET('/repairCompany/all-companies')
  Future<RepairCompaniesPagination> getRepairCompanies(
    @Query('page') int page,
    @Query('size') int size,
  );

  ///
  /// Clients
  ///

  @GET('/client/all')
  Future<ClientsPagination> getClients(
    @Query('page') int page,
    @Query('size') int size,
  );

  ///
  /// WashMachines
  ///

  @GET('/laundry/all-washing-machines-users/{laundryId}')
  Future<WashMachinesPagination> getLaundryWashMachines(
    @Path() String laundryId,
    @Query('page') int page,
    @Query('size') int size,
  );

  ///
  /// Employees
  ///

  @GET('/laundry/{laundryId}/all-employees')
  Future<EmployeesPagination> getLaundryEmployees(
    @Path() String laundryId,
    @Query('page') int page,
    @Query('size') int size,
  );

  ///
  /// Statistic
  ///

  @GET('/statistic/rating-all')
  Future<RatingPagination> getAllRating(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/statistic/payment-all')
  Future<PaymentPagination> getAllPayment(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/statistic/time-and-usage-all')
  Future<TimeAndUsagePagination> getAllTimeAndUsage(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/statistic/repair-all')
  Future<RepairPagination> getAllRepair(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/statistic/rating')
  Future<RatingStatisticLaundry> getLaundryRating();

  @GET('/statistic/payment')
  Future<PaymentStatisticLaundry> getLaundryPayment();

  @GET('/statistic/time-and-usage')
  Future<TimeAndUsageStatisticLaundry> getLaundryTimeAndUsage();

  @GET('/statistic/repair')
  Future<RepairStatisticLaundry> getLaundryRepair();
}
