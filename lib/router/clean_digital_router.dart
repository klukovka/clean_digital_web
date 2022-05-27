import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../api/models/create_update_requests/create_repair_event.dart';
import '../di/injection_container.dart';
import '../models/repair_product.dart';
import '../models/wash_machine.dart';
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
    await pushAndClearStack(const RepairCompanyRoute());
  }

  Future<void> replaceEmployeeMainPage() async {
    await pushAndClearStack(const EmployeeRoute());
  }

  Future<void> replaceLaundryMainPage() async {
    await replace(const LaundryRoute());
  }

  Future<void> replaceAdminMainPage() async {
    await replace(const AdminRoute());
  }

  Future<void> pushRestorePasswordPage() async {
    await push(const RestorePasswordRoute());
  }

  Future<void> pushAdminLaundryPage(String laundryId) async {
    await push(AdminLaundryRoute(laundryId: laundryId));
  }

  Future<void> pushSelectProductPage(
    ValueSetter<RepairProduct> onChosen,
  ) async {
    await push(LaundryEmployeeRepairProductsRoute(
      onChosen: onChosen,
    ));
  }

  Future<void> pushSelectWashMachinePage(
    ValueSetter<WashMachine> onChosen,
  ) async {
    await push(ChooseWashMachinesRoute(
      onChosen: onChosen,
    ));
  }
}
