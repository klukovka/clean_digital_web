import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../router/clean_digital_router.dart';
import '../buttons/primary_button.dart';

enum ConfirmDialogType {
  preferYes,
  preferNo,
}

class ConfirmDialog extends StatelessWidget {
  final VoidCallback? onPressed;
  final ConfirmDialogType type;

  const ConfirmDialog({
    Key? key,
    required this.onPressed,
    this.type = ConfirmDialogType.preferNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ConfirmDialogType.preferNo:
        return Row(
          children: [
            const SizedBox(width: 32),
            Expanded(child: _buildYesButton(context)),
            const SizedBox(width: 16),
            Expanded(child: _buildNoButton(context)),
            const SizedBox(width: 32),
          ],
        );
      case ConfirmDialogType.preferYes:
        return Row(
          children: [
            const SizedBox(width: 32),
            Expanded(child: _buildNoButton(context)),
            const SizedBox(width: 16),
            Expanded(child: _buildYesButton(context)),
            const SizedBox(width: 32),
          ],
        );
    }
  }

  Widget _buildYesButton(BuildContext context) {
    return PrimaryButton(
      title: CleanDigitalLocalizations.of(context).yes,
      onPressed: () {
        onPressed?.call();
        router.pop();
      },
      isOutlined: type != ConfirmDialogType.preferYes,
    );
  }

  Widget _buildNoButton(BuildContext context) {
    return PrimaryButton(
      title: CleanDigitalLocalizations.of(context).no,
      onPressed: Navigator.of(context).pop,
      isOutlined: type != ConfirmDialogType.preferNo,
    );
  }
}
