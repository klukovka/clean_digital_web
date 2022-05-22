// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_and_usage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeAndUsage _$TimeAndUsageFromJson(Map<String, dynamic> json) => TimeAndUsage(
      time: (json['time'] as num).toDouble(),
      powerUsage: (json['powerUsage'] as num).toDouble(),
    );

Map<String, dynamic> _$TimeAndUsageToJson(TimeAndUsage instance) =>
    <String, dynamic>{
      'time': instance.time,
      'powerUsage': instance.powerUsage,
    };
