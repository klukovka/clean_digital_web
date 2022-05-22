// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingPagination _$RatingPaginationFromJson(Map<String, dynamic> json) =>
    RatingPagination(
      rating: (json['content'] as List<dynamic>)
          .map(
              (e) => RatingStatisticLaundry.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$RatingPaginationToJson(RatingPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.rating,
    };
