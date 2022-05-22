import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../laundry.dart';
import 'repair.dart';
import 'repair_wash_machine_entry.dart';
import 'statistic_laundry.dart';

part 'repair_statistic_laundry.g.dart';

@immutable
@JsonSerializable()
class RepairStatisticLaundry extends StatisticLaundry {
  final Repair? laundryValue;
  final List<RepairWashMachineEntry> washMachineValue;

  const RepairStatisticLaundry({
    required this.laundryValue,
    required this.washMachineValue,
    required Laundry laundry,
  }) : super(laundry);

  factory RepairStatisticLaundry.fromJson(Map<String, dynamic> json) {
    return _$RepairStatisticLaundryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepairStatisticLaundryToJson(this);
}
