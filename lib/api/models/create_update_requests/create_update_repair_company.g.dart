// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_update_repair_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUpdateRepairCompanyRequest _$CreateUpdateRepairCompanyRequestFromJson(
        Map<String, dynamic> json) =>
    CreateUpdateRepairCompanyRequest(
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$CreateUpdateRepairCompanyRequestToJson(
        CreateUpdateRepairCompanyRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'password': instance.password,
    };
