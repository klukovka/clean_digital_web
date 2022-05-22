import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../statistic/rating_statistic_laundry.dart';
import 'pagination.dart';

part 'rating_pagination.g.dart';

@immutable
@JsonSerializable()
class RatingPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<RatingStatisticLaundry> rating;

  const RatingPagination({
    required this.rating,
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

  factory RatingPagination.fromJson(Map<String, dynamic> json) {
    return _$RatingPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RatingPaginationToJson(this);
}
