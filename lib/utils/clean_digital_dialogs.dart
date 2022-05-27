import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../api/models/create_update_requests/create_repair_event.dart';
import '../api/models/create_update_requests/create_update_employee.dart';
import '../api/models/create_update_requests/create_update_laundry.dart';
import '../api/models/create_update_requests/create_update_mode.dart';
import '../api/models/create_update_requests/create_update_repair_company.dart';
import '../api/models/create_update_requests/create_update_repair_product.dart';
import '../api/models/create_update_requests/create_update_wash_machine.dart';
import '../l10n/clean_digital_localizations.dart';
import '../models/additional_mode.dart';
import '../models/employee.dart';
import '../models/laundry.dart';
import '../models/mode.dart';
import '../models/repair_company.dart';
import '../models/repair_product.dart';
import '../models/wash_machine.dart';
import '../views/dialogs/base_dialog.dart';
import '../views/dialogs/confirm_dialog.dart';
import '../views/dialogs/create_mode_dialog.dart';
import '../views/dialogs/create_repair_event_dialog.dart';
import '../views/dialogs/create_update_employee_dialog.dart';
import '../views/dialogs/create_update_laundry_dialog.dart';
import '../views/dialogs/create_update_repair_company_dialog.dart';
import '../views/dialogs/create_update_repair_product_dialog.dart';
import '../views/dialogs/create_update_wash_machine_dialog.dart';
import '../views/dialogs/email_password_dialog.dart';
import '../views/dialogs/update_password_dialog.dart';

class CleanDigitalDialogs {
  final BuildContext context;

  CleanDigitalDialogs.of(this.context);

  Future<T?> _showBlurDialog<T>({
    required Widget body,
    required String title,
    double? height,
  }) async {
    return await showDialog(
      context: context,
      builder: (_) => BaseDialog.create(
        body: body,
        title: title,
        height: height,
      ),
    );
  }

  void showConfirmYesDialog({
    required String title,
    VoidCallback? onPressed,
  }) {
    _showBlurDialog(
      title: title,
      height: 20.h,
      body: ConfirmDialog(
        onPressed: onPressed,
        type: ConfirmDialogType.preferYes,
      ),
    );
  }

  void showConfirmNoDialog({
    required String title,
    VoidCallback? onPressed,
  }) {
    _showBlurDialog(
      height: 20.h,
      title: title,
      body: ConfirmDialog(onPressed: onPressed),
    );
  }

  void showUpdatePasswordDialog(void Function(String, String) onSave) {
    _showBlurDialog(
      height: 40.h,
      body: UpdatePasswordDialog(onSave: onSave),
      title: CleanDigitalLocalizations.of(context).updatePassword,
    );
  }

  void showRegisterAdminDialog(void Function(String, String) onSave) {
    _showBlurDialog(
      height: 40.h,
      body: EmailPasswordDialog(onSave: onSave),
      title: CleanDigitalLocalizations.of(context).registerAdmin,
    );
  }

  void showRegisterLaundryDialog(
    ValueSetter<CreateUpdateLaundryRequest> onSave,
  ) {
    _showBlurDialog(
      height: 65.h,
      body: CreateUpdateLaundryDialog(onSave: onSave),
      title: CleanDigitalLocalizations.of(context).registerLaundry,
    );
  }

  void showEditLaundryDialog(
    Laundry laundry,
    ValueSetter<CreateUpdateLaundryRequest> onSave,
  ) {
    _showBlurDialog(
      height: 55.h,
      body: CreateUpdateLaundryDialog(
        onSave: onSave,
        laundry: laundry,
      ),
      title: CleanDigitalLocalizations.of(context).editLaundry,
    );
  }

  void showRegisterWashMachineDialog(
    ValueSetter<CreateUpdateWashMachineRequest> onSave,
  ) {
    _showBlurDialog(
      height: 65.h,
      body: CreateUpdateWashMachineDialog(onSave: onSave),
      title: CleanDigitalLocalizations.of(context).createWashMachine,
    );
  }

  void showEditWashMachineDialog(
    WashMachine washMachine,
    ValueSetter<CreateUpdateWashMachineRequest> onSave,
  ) {
    _showBlurDialog(
      height: 65.h,
      body: CreateUpdateWashMachineDialog(
        onSave: onSave,
        washMachine: washMachine,
      ),
      title: CleanDigitalLocalizations.of(context).editWashMachine,
    );
  }

  void showRegisterEmployeeDialog(
    ValueSetter<CreateUpdateEmployeeRequest> onSave,
  ) {
    _showBlurDialog(
      height: 55.h,
      body: CreateUpdateEmployeeDialog(onSave: onSave),
      title: CleanDigitalLocalizations.of(context).createEmployee,
    );
  }

  void showEditEmployeeDialog(
    Employee employee,
    ValueSetter<CreateUpdateEmployeeRequest> onSave,
  ) {
    _showBlurDialog(
      height: 55.h,
      body: CreateUpdateEmployeeDialog(
        onSave: onSave,
        employee: employee,
      ),
      title: CleanDigitalLocalizations.of(context).editEmployee,
    );
  }

  void showRegisterModeDialog(
    ValueSetter<CreateUpdateModeRequest> onSave,
    bool isAdditional,
  ) {
    _showBlurDialog(
      height: 40.h,
      body: CreateUpdateModeDialog(onSave: onSave),
      title: isAdditional
          ? CleanDigitalLocalizations.of(context).createAdditionalMode
          : CleanDigitalLocalizations.of(context).createMode,
    );
  }

  void showEditAdditionalModeDialog(
    AdditionalMode additionalMode,
    ValueSetter<CreateUpdateModeRequest> onSave,
  ) {
    _showBlurDialog(
      height: 40.h,
      body: CreateUpdateModeDialog(
        onSave: onSave,
        mode: Mode(
          modeId: additionalMode.additionalModeId,
          name: additionalMode.name,
          time: additionalMode.time,
          costs: additionalMode.costs,
          laundryId: additionalMode.laundryId,
        ),
      ),
      title: CleanDigitalLocalizations.of(context).updateAdditionalMode,
    );
  }

  Future<void> showCreateRepairEventPage(
    ValueSetter<CreateRepairEventRequest> onSave,
  ) async {
    await _showBlurDialog(
      height: 50.h,
      body: CreateRepairEventDialog(onSave: onSave),
      title: CleanDigitalLocalizations.of(context).createRepairEvent,
    );
  }

  void showEditModeDialog(
    Mode mode,
    ValueSetter<CreateUpdateModeRequest> onSave,
  ) {
    _showBlurDialog(
      height: 40.h,
      body: CreateUpdateModeDialog(
        onSave: onSave,
        mode: mode,
      ),
      title: CleanDigitalLocalizations.of(context).updateMode,
    );
  }

  void showRegisterRepairCompanyDialog(
    ValueSetter<CreateUpdateRepairCompanyRequest> onSave,
  ) {
    _showBlurDialog(
      height: 60.h,
      body: CreateUpdateRepairCompanyDialog(onSave: onSave),
      title: CleanDigitalLocalizations.of(context).registerRepairCompany,
    );
  }

  void showEditRepairCompanyDialog(
    RepairCompany repairCompany,
    ValueSetter<CreateUpdateRepairCompanyRequest> onSave,
  ) {
    _showBlurDialog(
      height: 60.h,
      body: CreateUpdateRepairCompanyDialog(
        onSave: onSave,
        repairCompany: repairCompany,
      ),
      title: CleanDigitalLocalizations.of(context).editRepairCompany,
    );
  }

  void showCreateRepairProductDialog(
    ValueSetter<CreateUpdateRepairProductRequest> onSave,
  ) {
    _showBlurDialog(
      height: 60.h,
      body: CreateUpdateRepairProductDialog(onSave: onSave),
      title: CleanDigitalLocalizations.of(context).createRepairProduct,
    );
  }

  void showEditRepairProductDialog(
    RepairProduct repairProduct,
    ValueSetter<CreateUpdateRepairProductRequest> onSave,
  ) {
    _showBlurDialog(
      height: 60.h,
      body: CreateUpdateRepairProductDialog(
        onSave: onSave,
        repairProduct: repairProduct,
      ),
      title: CleanDigitalLocalizations.of(context).editRepairProduct,
    );
  }
}
