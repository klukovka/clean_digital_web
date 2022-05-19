import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../models/employee.dart';
import '../../resources/app_image_assets.dart';
import 'entity_container_tile.dart';
import 'entity_label.dart';

class EmployeeTile extends StatelessWidget {
  final Employee employee;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onMorePressed;

  const EmployeeTile({
    Key? key,
    required this.employee,
    this.onDeletePressed,
    this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityContainerTile(
      dialogTitle:
          CleanDigitalLocalizations.of(context).doYouWantToDeleteEmployee,
      imageAsset: AppImageAssets.employeeImage,
      onDeletePressed: onDeletePressed,
      onMorePressed: onMorePressed,
      child: _buildInfo(context),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final localization = CleanDigitalLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EntityLabel(title: localization.name, value: employee.name),
        EntityLabel(title: localization.phone, value: employee.phone),
        EntityLabel(title: localization.email, value: employee.user.email),
        EntityLabel(title: localization.sale, value: '${employee.birthday}'),
      ],
    );
  }
}
