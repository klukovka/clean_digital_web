// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_events_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairEventsPagination _$RepairEventsPaginationFromJson(
        Map<String, dynamic> json) =>
    RepairEventsPagination(
      repairEvents: (json['content'] as List<dynamic>)
          .map((e) => RepairEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$RepairEventsPaginationToJson(
        RepairEventsPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.repairEvents,
    };
