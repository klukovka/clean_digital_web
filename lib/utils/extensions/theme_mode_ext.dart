import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';

extension ThemeModeExt on ThemeMode {
  static ThemeMode getTheme(String key) {
    if (key == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else if (key == ThemeMode.light.name) {
      return ThemeMode.light;
    }

    return ThemeMode.system;
  }

  String get key {
    switch (this) {
      case ThemeMode.dark:
        return ThemeMode.dark.name;
      case ThemeMode.light:
        return ThemeMode.light.name;
      case ThemeMode.system:
        return ThemeMode.system.name;
    }
  }

  String getLabel(BuildContext context) {
    final loc = CleanDigitalLocalizations.of(context);
    switch (this) {
      case ThemeMode.dark:
        return loc.dark;
      case ThemeMode.light:
        return loc.light;
      case ThemeMode.system:
        return loc.system;
    }
  }
}
