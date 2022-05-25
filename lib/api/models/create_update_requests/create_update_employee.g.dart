// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_update_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUpdateEmployeeRequest _$CreateUpdateEmployeeRequestFromJson(
        Map<String, dynamic> json) =>
    CreateUpdateEmployeeRequest(
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String?,
      birthday: DateTime.parse(json['birthday'] as String),
    );

Map<String, dynamic> _$CreateUpdateEmployeeRequestToJson(
        CreateUpdateEmployeeRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'birthday': instance.birthday.toIso8601String(),
    };
