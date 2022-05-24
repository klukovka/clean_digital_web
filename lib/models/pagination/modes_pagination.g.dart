// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modes_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModesPagination _$ModesPaginationFromJson(Map<String, dynamic> json) =>
    ModesPagination(
      modes: (json['content'] as List<dynamic>)
          .map((e) => Mode.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$ModesPaginationToJson(ModesPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.modes,
    };
