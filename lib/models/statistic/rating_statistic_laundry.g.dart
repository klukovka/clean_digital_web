// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_statistic_laundry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingStatisticLaundry _$RatingStatisticLaundryFromJson(
        Map<String, dynamic> json) =>
    RatingStatisticLaundry(
      laundryValue: (json['laundryValue'] as num).toDouble(),
      washMachineValue: (json['washMachineValue'] as List<dynamic>)
          .map(
              (e) => RatingWashMachineEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      laundry: Laundry.fromJson(json['laundry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingStatisticLaundryToJson(
        RatingStatisticLaundry instance) =>
    <String, dynamic>{
      'laundry': instance.laundry,
      'laundryValue': instance.laundryValue,
      'washMachineValue': instance.washMachineValue,
    };
