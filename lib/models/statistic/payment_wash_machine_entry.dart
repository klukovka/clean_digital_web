import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'payment.dart';
import 'wash_machine_entry.dart';

import '../wash_machine.dart';

part 'payment_wash_machine_entry.g.dart';

@immutable
@JsonSerializable()
class PaymentWashMachineEntry extends WashMachineEntry {
  final Payment value;

  const PaymentWashMachineEntry(
    this.value,
    WashMachine washMachine,
  ) : super(washMachine);

  factory PaymentWashMachineEntry.fromJson(Map<String, dynamic> json) {
    return _$PaymentWashMachineEntryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentWashMachineEntryToJson(this);
}
