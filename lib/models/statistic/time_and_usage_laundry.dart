import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../laundry.dart';
import 'statistic_laundry.dart';
import 'time_and_usage.dart';
import 'time_and_usage_washing_machine_entry.dart';

part 'time_and_usage_laundry.g.dart';

@immutable
@JsonSerializable()
class TimeAndUsageStatisticLaundry extends StatisticLaundry {
  final TimeAndUsage? laundryValue;
  final List<TimeAndUsageWashMachineEntry> washMachineValue;

  const TimeAndUsageStatisticLaundry({
    required this.laundryValue,
    required this.washMachineValue,
    required Laundry laundry,
  }) : super(laundry);

  factory TimeAndUsageStatisticLaundry.fromJson(Map<String, dynamic> json) {
    return _$TimeAndUsageStatisticLaundryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimeAndUsageStatisticLaundryToJson(this);
}
