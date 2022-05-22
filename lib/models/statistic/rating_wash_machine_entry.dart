import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'wash_machine_entry.dart';

import '../wash_machine.dart';

part 'rating_wash_machine_entry.g.dart';

@immutable
@JsonSerializable()
class RatingWashMachineEntry extends WashMachineEntry {
  final double value;

  const RatingWashMachineEntry(
    this.value,
    WashMachine washMachine,
  ) : super(washMachine);

  factory RatingWashMachineEntry.fromJson(Map<String, dynamic> json) {
    return _$RatingWashMachineEntryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RatingWashMachineEntryToJson(this);
}
