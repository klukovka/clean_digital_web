import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../statistic/payment_statistic_laundry.dart';
import 'pagination.dart';

part 'payment_pagination.g.dart';

@immutable
@JsonSerializable()
class PaymentPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<PaymentStatisticLaundry> payment;

  const PaymentPagination({
    required this.payment,
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

  factory PaymentPagination.fromJson(Map<String, dynamic> json) {
    return _$PaymentPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentPaginationToJson(this);
}
