import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../additional_mode.dart';
import 'pagination.dart';

part 'additional_modes_pagination.g.dart';

@immutable
@JsonSerializable()
class AdditionalModesPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<AdditionalMode> additionalModes;

  const AdditionalModesPagination({
    required this.additionalModes,
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

  factory AdditionalModesPagination.fromJson(Map<String, dynamic> json) {
    return _$AdditionalModesPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AdditionalModesPaginationToJson(this);
}
