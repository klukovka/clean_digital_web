import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../statistic/time_and_usage_laundry.dart';
import 'pagination.dart';

part 'time_and_usage_pagination.g.dart';

@immutable
@JsonSerializable()
class TimeAndUsagePagination extends Pagination {
  @JsonKey(name: 'content')
  final List<TimeAndUsageStatisticLaundry> timeAndUsage;

  const TimeAndUsagePagination({
    required this.timeAndUsage,
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

  factory TimeAndUsagePagination.fromJson(Map<String, dynamic> json) {
    return _$TimeAndUsagePaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimeAndUsagePaginationToJson(this);
}
