import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_and_usage.g.dart';

@immutable
@JsonSerializable()
class TimeAndUsage extends Equatable {
  final double time;
  final double powerUsage;

  const TimeAndUsage({
    required this.time,
    required this.powerUsage,
  });

  factory TimeAndUsage.fromJson(Map<String, dynamic> json) {
    return _$TimeAndUsageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimeAndUsageToJson(this);

  @override
  List<Object> get props => [time, powerUsage];
}
