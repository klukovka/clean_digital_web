import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';

extension LocaleExt on Locale {
  String getLabel(BuildContext context) {
    final localizations = CleanDigitalLocalizations.of(context);

    switch (languageCode) {
      case 'en':
        return localizations.english;
      case 'uk':
        return localizations.ukrainian;
      default:
        return '';
    }
  }
}
