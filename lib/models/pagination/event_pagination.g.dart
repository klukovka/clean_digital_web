// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventsPagination _$EventsPaginationFromJson(Map<String, dynamic> json) =>
    EventsPagination(
      events: (json['content'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$EventsPaginationToJson(EventsPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.events,
    };
