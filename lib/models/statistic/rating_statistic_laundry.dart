import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../laundry.dart';
import 'rating_wash_machine_entry.dart';
import 'statistic_laundry.dart';

part 'rating_statistic_laundry.g.dart';

@immutable
@JsonSerializable()
class RatingStatisticLaundry extends StatisticLaundry {
  final double laundryValue;
  final List<RatingWashMachineEntry> washMachineValue;

  const RatingStatisticLaundry({
    required this.laundryValue,
    required this.washMachineValue,
    required Laundry laundry,
  }) : super(laundry);

  factory RatingStatisticLaundry.fromJson(Map<String, dynamic> json) {
    return _$RatingStatisticLaundryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RatingStatisticLaundryToJson(this);
}
