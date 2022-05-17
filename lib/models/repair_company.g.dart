// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairCompany _$RepairCompanyFromJson(Map<String, dynamic> json) =>
    RepairCompany(
      repairCompanyId: json['repairCompanyId'] as String? ?? '',
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      userId: json['userId'] as String,
      user: json['user'] == null
          ? const User.empty()
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepairCompanyToJson(RepairCompany instance) =>
    <String, dynamic>{
      'repairCompanyId': instance.repairCompanyId,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'userId': instance.userId,
      'user': instance.user,
    };
