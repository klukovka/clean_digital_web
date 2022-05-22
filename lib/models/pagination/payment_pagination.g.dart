// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentPagination _$PaymentPaginationFromJson(Map<String, dynamic> json) =>
    PaymentPagination(
      payment: (json['content'] as List<dynamic>)
          .map((e) =>
              PaymentStatisticLaundry.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$PaymentPaginationToJson(PaymentPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.payment,
    };
