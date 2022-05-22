// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_statistic_laundry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairStatisticLaundry _$RepairStatisticLaundryFromJson(
        Map<String, dynamic> json) =>
    RepairStatisticLaundry(
      laundryValue: json['laundryValue'] == null
          ? null
          : Repair.fromJson(json['laundryValue'] as Map<String, dynamic>),
      washMachineValue: (json['washMachineValue'] as List<dynamic>)
          .map(
              (e) => RepairWashMachineEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      laundry: Laundry.fromJson(json['laundry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepairStatisticLaundryToJson(
        RepairStatisticLaundry instance) =>
    <String, dynamic>{
      'laundry': instance.laundry,
      'laundryValue': instance.laundryValue,
      'washMachineValue': instance.washMachineValue,
    };
