// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_update_wash_machine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUpdateWashMachineRequest _$CreateUpdateWashMachineRequestFromJson(
        Map<String, dynamic> json) =>
    CreateUpdateWashMachineRequest(
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      capacity: json['capacity'] as int,
      powerUsage: json['powerUsage'] as int,
      spinningSpeed: json['spinningSpeed'] as int,
      maxTime: json['maxTime'] as int,
    );

Map<String, dynamic> _$CreateUpdateWashMachineRequestToJson(
        CreateUpdateWashMachineRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'capacity': instance.capacity,
      'powerUsage': instance.powerUsage,
      'spinningSpeed': instance.spinningSpeed,
      'maxTime': instance.maxTime,
    };
