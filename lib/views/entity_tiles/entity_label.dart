import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';

class EntityLabel extends StatelessWidget {
  final String title;
  final dynamic value;

  const EntityLabel({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: AutoSizeText(
              '$title:',
              style: Theme.of(context).textTheme.headline6,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AutoSizeText(
              value != null
                  ? '$value'
                  : CleanDigitalLocalizations.of(context).nd,
              style: Theme.of(context).textTheme.headline5,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
