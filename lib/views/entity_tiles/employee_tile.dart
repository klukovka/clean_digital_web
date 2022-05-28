import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app_control/app_control_cubit.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/employee.dart';
import '../../resources/app_image_assets.dart';
import '../../utils/extensions/date_time_ext.dart';
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
        EntityLabel(
          title: localization.birthday,
          value: employee.birthday.format(
            context.read<AppControlCubit>().state.locale,
          ),
        ),
      ],
    );
  }
}
