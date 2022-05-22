import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../statistic/repair_statistic_laundry.dart';
import 'pagination.dart';

part 'repair_pagination.g.dart';

@immutable
@JsonSerializable()
class RepairPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<RepairStatisticLaundry> repair;

  const RepairPagination({
    required this.repair,
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

  factory RepairPagination.fromJson(Map<String, dynamic> json) {
    return _$RepairPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepairPaginationToJson(this);
}
