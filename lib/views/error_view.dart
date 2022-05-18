import 'package:flutter/material.dart';

import '../l10n/clean_digital_localizations.dart';
import 'buttons/primary_button.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback onPressed;

  const ErrorView({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = CleanDigitalLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            localizations.error,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 12),
          Text(
            localizations.pageLoadError,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 32),
          PrimaryButton.custom(
            titleWidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.replay_outlined),
                const SizedBox(width: 4),
                Text(localizations.retry),
              ],
            ),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
