// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_update_repair_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUpdateRepairProductRequest _$CreateUpdateRepairProductRequestFromJson(
        Map<String, dynamic> json) =>
    CreateUpdateRepairProductRequest(
      description: json['description'] as String,
      type: $enumDecode(_$RepairTypeEnumMap, json['type']),
      costs: json['costs'] as int,
    );

Map<String, dynamic> _$CreateUpdateRepairProductRequestToJson(
        CreateUpdateRepairProductRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
      'type': _$RepairTypeEnumMap[instance.type],
      'costs': instance.costs,
    };

const _$RepairTypeEnumMap = {
  RepairType.repair: 'FIX',
  RepairType.inspection: 'INSPECTION',
  RepairType.software: 'SOFTWARE',
};
