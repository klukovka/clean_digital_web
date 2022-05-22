import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../wash_machine.dart';
import 'time_and_usage.dart';
import 'wash_machine_entry.dart';

part 'time_and_usage_washing_machine_entry.g.dart';

@immutable
@JsonSerializable()
class TimeAndUsageWashMachineEntry extends WashMachineEntry {
  final TimeAndUsage value;

  const TimeAndUsageWashMachineEntry(
    this.value,
    WashMachine washMachine,
  ) : super(washMachine);

  factory TimeAndUsageWashMachineEntry.fromJson(Map<String, dynamic> json) {
    return _$TimeAndUsageWashMachineEntryFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$TimeAndUsageWashMachineEntryToJson(this);
}
