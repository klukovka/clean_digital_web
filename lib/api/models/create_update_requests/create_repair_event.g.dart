// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_repair_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRepairEventRequest _$CreateRepairEventRequestFromJson(
        Map<String, dynamic> json) =>
    CreateRepairEventRequest(
      repairProductId: json['repairProductId'] as String,
      washMachineId: json['washMachineId'] as String,
    );

Map<String, dynamic> _$CreateRepairEventRequestToJson(
        CreateRepairEventRequest instance) =>
    <String, dynamic>{
      'repairProductId': instance.repairProductId,
      'washMachineId': instance.washMachineId,
    };
