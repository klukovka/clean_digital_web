import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'wash_machine_entry.dart';

import '../wash_machine.dart';

part 'repair_wash_machine_entry.g.dart';

@immutable
@JsonSerializable()
class RepairWashMachineEntry extends WashMachineEntry {
  final double value;

  const RepairWashMachineEntry(
    this.value,
    WashMachine washMachine,
  ) : super(washMachine);

  factory RepairWashMachineEntry.fromJson(Map<String, dynamic> json) {
    return _$RepairWashMachineEntryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepairWashMachineEntryToJson(this);
}
