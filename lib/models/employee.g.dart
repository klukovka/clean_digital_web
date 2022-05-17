// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      employeeId: json['employeeId'] as String? ?? '',
      name: json['name'] as String,
      phone: json['phone'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      userId: json['userId'] as String,
      laundryId: json['laundryId'] as String,
      user: json['user'] == null
          ? const User.empty()
          : User.fromJson(json['user'] as Map<String, dynamic>),
      laundry: json['laundry'] == null
          ? const Laundry.empty()
          : Laundry.fromJson(json['laundry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'employeeId': instance.employeeId,
      'name': instance.name,
      'phone': instance.phone,
      'birthday': instance.birthday.toIso8601String(),
      'userId': instance.userId,
      'user': instance.user,
      'laundryId': instance.laundryId,
      'laundry': instance.laundry,
    };
