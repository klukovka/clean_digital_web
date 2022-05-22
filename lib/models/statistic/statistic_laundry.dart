import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../laundry.dart';

part 'statistic_laundry.g.dart';

@immutable
@JsonSerializable()
class StatisticLaundry extends Equatable {
  final Laundry laundry;

  const StatisticLaundry(this.laundry);

  @override
  List<Object> get props => [laundry];

  factory StatisticLaundry.fromJson(Map<String, dynamic> json) {
    return _$StatisticLaundryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatisticLaundryToJson(this);
}
