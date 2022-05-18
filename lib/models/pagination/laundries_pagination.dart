import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../laundry.dart';
import 'pagination.dart';

part 'laundries_pagination.g.dart';

@immutable
@JsonSerializable()
class LaundriesPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<Laundry> laundries;

  const LaundriesPagination({
    required this.laundries,
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

  factory LaundriesPagination.fromJson(Map<String, dynamic> json) {
    return _$LaundriesPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LaundriesPaginationToJson(this);
}
