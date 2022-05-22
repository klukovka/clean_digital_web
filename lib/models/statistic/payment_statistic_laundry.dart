import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../laundry.dart';
import 'payment.dart';
import 'payment_wash_machine_entry.dart';
import 'statistic_laundry.dart';

part 'payment_statistic_laundry.g.dart';

@immutable
@JsonSerializable()
class PaymentStatisticLaundry extends StatisticLaundry {
  final Payment? laundryValue;
  final List<PaymentWashMachineEntry> washMachineValue;

  const PaymentStatisticLaundry({
    required this.laundryValue,
    required this.washMachineValue,
    required Laundry laundry,
  }) : super(laundry);

  factory PaymentStatisticLaundry.fromJson(Map<String, dynamic> json) {
    return _$PaymentStatisticLaundryFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentStatisticLaundryToJson(this);
}
