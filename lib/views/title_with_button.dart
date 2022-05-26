import 'package:flutter/material.dart';

import '../l10n/clean_digital_localizations.dart';
import 'buttons/primary_button.dart';

class TitleWithButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? titleWidget;

  const TitleWithButton({
    Key? key,
    this.title = '',
    this.isLoading = false,
    this.onPressed,
    this.titleWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = CleanDigitalLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        PrimaryButton.custom(
          fullWidth: false,
          onPressed: onPressed,
          isLoading: isLoading,
          titleWidget: titleWidget ??
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add),
                  const SizedBox(width: 8),
                  Text(localizations.addNew),
                ],
              ),
        )
      ],
    );
  }
}
