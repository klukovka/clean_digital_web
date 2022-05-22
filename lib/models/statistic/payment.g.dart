// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      paidBonuses: (json['paidBonuses'] as num).toDouble(),
      paidMoney: (json['paidMoney'] as num).toDouble(),
      all: (json['all'] as num).toDouble(),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'paidBonuses': instance.paidBonuses,
      'paidMoney': instance.paidMoney,
      'all': instance.all,
    };
