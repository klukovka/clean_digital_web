// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_statistic_laundry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentStatisticLaundry _$PaymentStatisticLaundryFromJson(
        Map<String, dynamic> json) =>
    PaymentStatisticLaundry(
      laundryValue: json['laundryValue'] == null
          ? null
          : Payment.fromJson(json['laundryValue'] as Map<String, dynamic>),
      washMachineValue: (json['washMachineValue'] as List<dynamic>)
          .map((e) =>
              PaymentWashMachineEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      laundry: Laundry.fromJson(json['laundry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentStatisticLaundryToJson(
        PaymentStatisticLaundry instance) =>
    <String, dynamic>{
      'laundry': instance.laundry,
      'laundryValue': instance.laundryValue,
      'washMachineValue': instance.washMachineValue,
    };
