// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_and_usage_washing_machine_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeAndUsageWashMachineEntry _$TimeAndUsageWashMachineEntryFromJson(
        Map<String, dynamic> json) =>
    TimeAndUsageWashMachineEntry(
      TimeAndUsage.fromJson(json['value'] as Map<String, dynamic>),
      WashMachine.fromJson(json['washMachine'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimeAndUsageWashMachineEntryToJson(
        TimeAndUsageWashMachineEntry instance) =>
    <String, dynamic>{
      'washMachine': instance.washMachine,
      'value': instance.value,
    };
