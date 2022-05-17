// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wash_machine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WashMachine _$WashMachineFromJson(Map<String, dynamic> json) => WashMachine(
      washMachineId: json['washMachineId'] as String? ?? '',
      laundryId: json['laundryId'] as String,
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      capacity: json['capacity'] as int,
      powerUsage: json['powerUsage'] as int,
      spinningSpeed: json['spinningSpeed'] as int,
      maxTime: json['maxTime'] as int,
      currentTime: json['currentTime'] as int,
      isWorking: json['isWorking'] as bool,
      isWashing: json['isWashing'] as bool,
      laundry: json['laundry'] == null
          ? const Laundry.empty()
          : Laundry.fromJson(json['laundry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WashMachineToJson(WashMachine instance) =>
    <String, dynamic>{
      'washMachineId': instance.washMachineId,
      'laundryId': instance.laundryId,
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'capacity': instance.capacity,
      'powerUsage': instance.powerUsage,
      'spinningSpeed': instance.spinningSpeed,
      'maxTime': instance.maxTime,
      'currentTime': instance.currentTime,
      'isWorking': instance.isWorking,
      'isWashing': instance.isWashing,
      'laundry': instance.laundry,
    };
