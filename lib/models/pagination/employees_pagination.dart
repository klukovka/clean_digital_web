import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../employee.dart';
import 'pagination.dart';

part 'employees_pagination.g.dart';

@immutable
@JsonSerializable()
class EmployeesPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<Employee> employees;

  const EmployeesPagination({
    required this.employees,
    required int page,
    required int size,
    required int totalElements,
    required int totalPages,
  }) : super(
          page: page,
          size: size,
          totalElements: totalElements,
          totalPages: totalPages,
        );

  factory EmployeesPagination.fromJson(Map<String, dynamic> json) {
    return _$EmployeesPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeesPaginationToJson(this);
}
