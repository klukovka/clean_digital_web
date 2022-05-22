// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_wash_machine_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairWashMachineEntry _$RepairWashMachineEntryFromJson(
        Map<String, dynamic> json) =>
    RepairWashMachineEntry(
      Repair.fromJson(json['value'] as Map<String, dynamic>),
      WashMachine.fromJson(json['washMachine'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepairWashMachineEntryToJson(
        RepairWashMachineEntry instance) =>
    <String, dynamic>{
      'washMachine': instance.washMachine,
      'value': instance.value,
    };
