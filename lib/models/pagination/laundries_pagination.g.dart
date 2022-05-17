// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laundries_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaundriesPagination _$LaundriesPaginationFromJson(Map<String, dynamic> json) =>
    LaundriesPagination(
      laundries: (json['content'] as List<dynamic>)
          .map((e) => Laundry.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$LaundriesPaginationToJson(
        LaundriesPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.laundries,
    };
