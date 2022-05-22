// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_and_usage_laundry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeAndUsageStatisticLaundry _$TimeAndUsageStatisticLaundryFromJson(
        Map<String, dynamic> json) =>
    TimeAndUsageStatisticLaundry(
      laundryValue: json['laundryValue'] == null
          ? null
          : TimeAndUsage.fromJson(json['laundryValue'] as Map<String, dynamic>),
      washMachineValue: (json['washMachineValue'] as List<dynamic>)
          .map((e) =>
              TimeAndUsageWashMachineEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      laundry: Laundry.fromJson(json['laundry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimeAndUsageStatisticLaundryToJson(
        TimeAndUsageStatisticLaundry instance) =>
    <String, dynamic>{
      'laundry': instance.laundry,
      'laundryValue': instance.laundryValue,
      'washMachineValue': instance.washMachineValue,
    };
