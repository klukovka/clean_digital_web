import 'package:equatable/equatable.dart';

import '../laundry.dart';
import 'payment.dart';
import 'payment_wash_machine_entry.dart';
import 'rating_wash_machine_entry.dart';
import 'repair.dart';
import 'repair_wash_machine_entry.dart';
import 'time_and_usage.dart';
import 'time_and_usage_washing_machine_entry.dart';

class AllLaundryStatistic extends Equatable {
  final Laundry laundry;
  final Payment? laundryPaymentValue;
  final List<PaymentWashMachineEntry> washMachinePaymentValue;
  final double laundryRatingValue;
  final List<RatingWashMachineEntry> washMachineRatingValue;
  final Repair? laundryRepairValue;
  final List<RepairWashMachineEntry> washMachineRepairValue;
  final TimeAndUsage? laundryTimeAndUsageValue;
  final List<TimeAndUsageWashMachineEntry> washMachineTimeAndUsageValue;

  const AllLaundryStatistic({
    required this.laundry,
    required this.laundryPaymentValue,
    required this.washMachinePaymentValue,
    required this.laundryRatingValue,
    required this.washMachineRatingValue,
    required this.laundryRepairValue,
    required this.washMachineRepairValue,
    required this.laundryTimeAndUsageValue,
    required this.washMachineTimeAndUsageValue,
  });

  const AllLaundryStatistic.empty()
      : laundry = const Laundry.empty(),
        laundryPaymentValue = null,
        washMachinePaymentValue = const [],
        laundryRatingValue = 0,
        washMachineRatingValue = const [],
        laundryRepairValue = null,
        washMachineRepairValue = const [],
        laundryTimeAndUsageValue = null,
        washMachineTimeAndUsageValue = const [];

  @override
  List<Object?> get props {
    return [
      laundry,
      laundryPaymentValue,
      washMachinePaymentValue,
      laundryRatingValue,
      washMachineRatingValue,
      laundryRepairValue,
      washMachineRepairValue,
      laundryTimeAndUsageValue,
      washMachineTimeAndUsageValue,
    ];
  }
}
