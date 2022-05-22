// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_and_usage_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeAndUsagePagination _$TimeAndUsagePaginationFromJson(
        Map<String, dynamic> json) =>
    TimeAndUsagePagination(
      timeAndUsage: (json['content'] as List<dynamic>)
          .map((e) =>
              TimeAndUsageStatisticLaundry.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$TimeAndUsagePaginationToJson(
        TimeAndUsagePagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.timeAndUsage,
    };
