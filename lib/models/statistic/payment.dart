import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@immutable
@JsonSerializable()
class Payment extends Equatable {
  final double paidBonuses;
  final double paidMoney;
  final double all;

  const Payment({
    required this.paidBonuses,
    required this.paidMoney,
    required this.all,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return _$PaymentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  @override
  List<Object> get props => [paidBonuses, paidMoney, all];
}
