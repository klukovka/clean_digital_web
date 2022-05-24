// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_modes_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalModesPagination _$AdditionalModesPaginationFromJson(
        Map<String, dynamic> json) =>
    AdditionalModesPagination(
      additionalModes: (json['content'] as List<dynamic>)
          .map((e) => AdditionalMode.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$AdditionalModesPaginationToJson(
        AdditionalModesPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.additionalModes,
    };
