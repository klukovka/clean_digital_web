import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../mode.dart';
import 'pagination.dart';

part 'modes_pagination.g.dart';

@immutable
@JsonSerializable()
class ModesPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<Mode> modes;

  const ModesPagination({
    required this.modes,
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

  factory ModesPagination.fromJson(Map<String, dynamic> json) {
    return _$ModesPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ModesPaginationToJson(this);
}
