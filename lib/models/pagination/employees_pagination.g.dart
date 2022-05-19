// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeesPagination _$EmployeesPaginationFromJson(Map<String, dynamic> json) =>
    EmployeesPagination(
      employees: (json['content'] as List<dynamic>)
          .map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$EmployeesPaginationToJson(
        EmployeesPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.employees,
    };
