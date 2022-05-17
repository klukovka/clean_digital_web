import 'package:injectable/injectable.dart';

import '../di/injection_container.dart';
import 'app_auto_router.gr.dart';
import 'base_router.dart';

final router = locator<CleanDigitalRouter>();

@singleton
class CleanDigitalRouter extends BaseRouter {
  CleanDigitalRouter(AppAutoRouter router) : super(router);

  Future<void> replaceLoginPage() async {
    await pushAndClearStack(const LoginRoute());
  }

  Future<void> replaceSplashPage() async {
    await pushAndClearStack(const SplashRoute());
  }

  Future<void> replaceRepairCompanyMainPage() async {
    await pushAndClearStack(const RepairCompanyMainRoute());
  }

  Future<void> replaceEmployeeMainPage() async {
    await pushAndClearStack(const EmployeeMainRoute());
  }

  Future<void> replaceLaundryMainPage() async {
    await replace(const LaundryMainRoute());
  }

  Future<void> replaceAdminMainPage() async {
    await replace(const AdminRoute());
  }

  Future<void> pushRestorePasswordPage() async {
    await push(const RestorePasswordRoute());
  }
}
