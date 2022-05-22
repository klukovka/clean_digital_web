import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../wash_machine.dart';
part 'wash_machine_entry.g.dart';

@immutable
@JsonSerializable()
class WashMachineEntry extends Equatable {
  final WashMachine washMachine;

  const WashMachineEntry(this.washMachine);

  @override
  List<Object> get props => [washMachine];

  factory WashMachineEntry.fromJson(Map<String, dynamic> json) {
    return _$WashMachineEntryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WashMachineEntryToJson(this);
}
