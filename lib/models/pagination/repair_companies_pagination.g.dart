// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_companies_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairCompaniesPagination _$RepairCompaniesPaginationFromJson(
        Map<String, dynamic> json) =>
    RepairCompaniesPagination(
      companies: (json['content'] as List<dynamic>)
          .map((e) => RepairCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$RepairCompaniesPaginationToJson(
        RepairCompaniesPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.companies,
    };
