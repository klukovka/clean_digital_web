import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../repair_company.dart';
import 'pagination.dart';

part 'repair_companies_pagination.g.dart';

@immutable
@JsonSerializable()
class RepairCompaniesPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<RepairCompany> companies;

  const RepairCompaniesPagination({
    required this.companies,
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

  factory RepairCompaniesPagination.fromJson(Map<String, dynamic> json) {
    return _$RepairCompaniesPaginationFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$RepairCompaniesPaginationToJson(this);
}
