import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../utils/clean_digital_dialogs.dart';
import '../buttons/primary_button.dart';

class EntityContainerTile extends StatelessWidget {
  final Widget child;
  final String dialogTitle;
  final Widget? titleChild;
  final String? imageAsset;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onMorePressed;
  final Color? color;

  const EntityContainerTile({
    Key? key,
    required this.child,
    required this.onDeletePressed,
    required this.onMorePressed,
    this.dialogTitle = '',
    this.color,
    this.imageAsset,
    this.titleChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              if (titleChild != null) Expanded(child: titleChild!),
              if (imageAsset != null)
                Image.asset(
                  imageAsset!,
                  width: 10.w,
                ),
              Expanded(child: child),
            ],
          ),
          const SizedBox(height: 16),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        if (onMorePressed != null)
          Expanded(
            child: PrimaryButton(
              title: CleanDigitalLocalizations.of(context).more,
              onPressed: onMorePressed,
            ),
          ),
        const SizedBox(width: 16),
        if (onDeletePressed != null)
          Expanded(
            child: PrimaryButton(
              title: CleanDigitalLocalizations.of(context).delete,
              isOutlined: true,
              onPressed: () {
                CleanDigitalDialogs.of(context).showConfirmNoDialog(
                  title: dialogTitle,
                  onPressed: onDeletePressed,
                );
              },
            ),
          ),
      ],
    );
  }
}
