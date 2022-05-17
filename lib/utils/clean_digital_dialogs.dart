import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../views/dialogs/base_dialog.dart';
import '../views/dialogs/confirm_dialog.dart';

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
    required VoidCallback onPressed,
  }) {
    _showBlurDialog(
      title: title,
      height: 30.h,
      body: ConfirmDialog(
        onPressed: onPressed,
        type: ConfirmDialogType.preferYes,
      ),
    );
  }

  void showConfirmNoDialog({
    required String title,
    required VoidCallback onPressed,
  }) {
    _showBlurDialog(
      height: 30.h,
      title: title,
      body: ConfirmDialog(onPressed: onPressed),
    );
  }
}
