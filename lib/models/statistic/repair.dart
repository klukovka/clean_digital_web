import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repair.g.dart';

@immutable
@JsonSerializable()
class Repair extends Equatable {
  final int amount;
  final int money;

  const Repair({
    required this.amount,
    required this.money,
  });

  factory Repair.fromJson(Map<String, dynamic> json) {
    return _$RepairFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepairToJson(this);

  @override
  List<Object> get props => [amount, money];
}
