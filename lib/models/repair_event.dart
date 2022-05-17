import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'repair_product.dart';
import 'wash_machine.dart';

part 'repair_event.g.dart';

@immutable
@JsonSerializable()
class RepairEvent extends Equatable {
  @JsonKey(defaultValue: '')
  final String repairEventId;
  final int costs;
  final DateTime date;
  final String washMachineId;
  final String repairProductId;
  final bool done;
  final WashMachine washMachine;
  final RepairProduct repairProduct;

  const RepairEvent({
    required this.repairEventId,
    required this.costs,
    required this.date,
    required this.washMachineId,
    required this.repairProductId,
    required this.done,
    this.washMachine = const WashMachine.empty(),
    this.repairProduct = const RepairProduct.empty(),
  });

  factory RepairEvent.fromJson(Map<String, dynamic> json) {
    return _$RepairEventFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepairEventToJson(this);

  @override
  List<Object> get props {
    return [
      repairEventId,
      costs,
      date,
      washMachineId,
      repairProductId,
      done,
      washMachine,
      repairProduct,
    ];
  }
}
