// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsPagination _$ClientsPaginationFromJson(Map<String, dynamic> json) =>
    ClientsPagination(
      clients: (json['content'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$ClientsPaginationToJson(ClientsPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.clients,
    };
