import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../l10n/clean_digital_localizations.dart';

enum RepairType {
  @JsonValue('FIX')
  repair,
  @JsonValue('INSPECTION')
  inspection,
  @JsonValue('SOFTWARE')
  software;

  String getTitle(BuildContext context) {
    final loc = CleanDigitalLocalizations.of(context);
    switch (this) {
      case RepairType.repair:
        return loc.repair;
      case RepairType.inspection:
        return loc.inspection;
      case RepairType.software:
        return loc.software;
    }
  }
}
