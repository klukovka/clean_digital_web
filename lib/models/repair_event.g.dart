// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairEvent _$RepairEventFromJson(Map<String, dynamic> json) => RepairEvent(
      repairEventId: json['repairEventId'] as String? ?? '',
      costs: json['costs'] as int,
      date: DateTime.parse(json['date'] as String),
      washMachineId: json['washMachineId'] as String,
      repairProductId: json['repairProductId'] as String,
      done: json['done'] as bool,
      washMachine: json['washMachine'] == null
          ? const WashMachine.empty()
          : WashMachine.fromJson(json['washMachine'] as Map<String, dynamic>),
      repairProduct: json['repairProduct'] == null
          ? const RepairProduct.empty()
          : RepairProduct.fromJson(
              json['repairProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepairEventToJson(RepairEvent instance) =>
    <String, dynamic>{
      'repairEventId': instance.repairEventId,
      'costs': instance.costs,
      'date': instance.date.toIso8601String(),
      'washMachineId': instance.washMachineId,
      'repairProductId': instance.repairProductId,
      'done': instance.done,
      'washMachine': instance.washMachine,
      'repairProduct': instance.repairProduct,
    };
