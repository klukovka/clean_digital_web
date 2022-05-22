// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_wash_machine_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentWashMachineEntry _$PaymentWashMachineEntryFromJson(
        Map<String, dynamic> json) =>
    PaymentWashMachineEntry(
      Payment.fromJson(json['value'] as Map<String, dynamic>),
      WashMachine.fromJson(json['washMachine'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentWashMachineEntryToJson(
        PaymentWashMachineEntry instance) =>
    <String, dynamic>{
      'washMachine': instance.washMachine,
      'value': instance.value,
    };
