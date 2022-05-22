// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_products_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairProductsPagination _$RepairProductsPaginationFromJson(
        Map<String, dynamic> json) =>
    RepairProductsPagination(
      products: (json['content'] as List<dynamic>)
          .map((e) => RepairProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$RepairProductsPaginationToJson(
        RepairProductsPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.products,
    };
