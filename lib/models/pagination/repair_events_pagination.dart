import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../repair_event.dart';
import 'pagination.dart';

part 'repair_events_pagination.g.dart';

@immutable
@JsonSerializable()
class RepairEventsPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<RepairEvent> repairEvents;

  const RepairEventsPagination({
    required this.repairEvents,
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

  factory RepairEventsPagination.fromJson(Map<String, dynamic> json) {
    return _$RepairEventsPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepairEventsPaginationToJson(this);
}
