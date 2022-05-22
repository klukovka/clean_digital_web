// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_wash_machine_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingWashMachineEntry _$RatingWashMachineEntryFromJson(
        Map<String, dynamic> json) =>
    RatingWashMachineEntry(
      (json['value'] as num).toDouble(),
      WashMachine.fromJson(json['washMachine'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingWashMachineEntryToJson(
        RatingWashMachineEntry instance) =>
    <String, dynamic>{
      'washMachine': instance.washMachine,
      'value': instance.value,
    };
