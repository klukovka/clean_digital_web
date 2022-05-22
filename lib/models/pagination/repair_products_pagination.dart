import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../repair_product.dart';
import 'pagination.dart';

part 'repair_products_pagination.g.dart';

@immutable
@JsonSerializable()
class RepairProductsPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<RepairProduct> products;

  const RepairProductsPagination({
    required this.products,
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

  factory RepairProductsPagination.fromJson(Map<String, dynamic> json) {
    return _$RepairProductsPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepairProductsPaginationToJson(this);
}
