import 'package:injectable/injectable.dart';

import '../di/injection_container.dart';
import 'app_auto_router.gr.dart';
import 'base_router.dart';

final router = locator<CleanDigitalRouter>();

@singleton
class CleanDigitalRouter extends BaseRouter {
  CleanDigitalRouter(AppAutoRouter router) : super(router);

  Future<void> resetToLoginPage() async {
    await pushAndClearStack(const LoginRoute());
  }

  Future<void> resetToSplashPage() async {
    await pushAndClearStack(const SplashRoute());
  }

  Future<void> resetToRepairCompanyMainPage() async {
    await pushAndClearStack(const RepairCompanyMainRoute());
  }

  Future<void> resetToEmployeeMainPage() async {
    await pushAndClearStack(const EmployeeMainRoute());
  }

  Future<void> resetToLaundryMainPage() async {
    await pushAndClearStack(const LaundryMainRoute());
  }

  Future<void> resetToAdminMainPage() async {
    await pushAndClearStack(const AdminMainRoute());
  }

  Future<void> pushRestorePasswordPage() async {
    await push(const RestorePasswordRoute());
  }
}
