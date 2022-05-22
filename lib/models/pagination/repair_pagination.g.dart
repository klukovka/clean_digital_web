// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairPagination _$RepairPaginationFromJson(Map<String, dynamic> json) =>
    RepairPagination(
      repair: (json['content'] as List<dynamic>)
          .map(
              (e) => RepairStatisticLaundry.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$RepairPaginationToJson(RepairPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.repair,
    };
