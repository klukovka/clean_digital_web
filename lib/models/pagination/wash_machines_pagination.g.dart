// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wash_machines_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WashMachinesPagination _$WashMachinesPaginationFromJson(
        Map<String, dynamic> json) =>
    WashMachinesPagination(
      washMachines: (json['content'] as List<dynamic>)
          .map((e) => WashMachine.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      size: json['size'] as int,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$WashMachinesPaginationToJson(
        WashMachinesPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'content': instance.washMachines,
    };
