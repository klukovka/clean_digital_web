import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../event.dart';
import 'pagination.dart';

part 'event_pagination.g.dart';

@immutable
@JsonSerializable()
class EventsPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<Event> events;

  const EventsPagination({
    required this.events,
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

  factory EventsPagination.fromJson(Map<String, dynamic> json) {
    return _$EventsPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EventsPaginationToJson(this);
}
