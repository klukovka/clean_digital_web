// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairProduct _$RepairProductFromJson(Map<String, dynamic> json) =>
    RepairProduct(
      repairProductId: json['repairProductId'] as String? ?? '',
      costs: (json['costs'] as num).toDouble(),
      description: json['description'] as String,
      repairCompanyId: json['repairCompanyId'] as String,
      type: $enumDecode(_$RepairTypeEnumMap, json['type']),
      repairCompany: json['repairCompany'] == null
          ? const RepairCompany.empty()
          : RepairCompany.fromJson(
              json['repairCompany'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepairProductToJson(RepairProduct instance) =>
    <String, dynamic>{
      'repairProductId': instance.repairProductId,
      'costs': instance.costs,
      'description': instance.description,
      'repairCompanyId': instance.repairCompanyId,
      'type': _$RepairTypeEnumMap[instance.type],
      'repairCompany': instance.repairCompany,
    };

const _$RepairTypeEnumMap = {
  RepairType.repair: 'FIX',
  RepairType.inspection: 'INSPECTION',
  RepairType.software: 'SOFTWARE',
};
