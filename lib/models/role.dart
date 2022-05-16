import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../l10n/clean_digital_localizations.dart';

enum Role {
  @JsonValue('ADMIN')
  admin,
  @JsonValue('LAUNDRY')
  laundry,
  @JsonValue('EMPLOYEE')
  employee,
  @JsonValue('CLIENT')
  client,
  @JsonValue('IOT')
  iot,
  @JsonValue('REPAIR_COMPANY')
  repairCompany;

  String getTitle(BuildContext context) {
    final loc = CleanDigitalLocalizations.of(context);
    switch (this) {
      case Role.admin:
        return loc.admin;
      case Role.laundry:
        return loc.laundry;
      case Role.employee:
        return loc.employee;
      case Role.client:
        return loc.client;
      case Role.iot:
        return loc.iot;
      case Role.repairCompany:
        return loc.repairCompany;
    }
  }
}
