// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_update_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUpdateModeRequest _$CreateUpdateModeRequestFromJson(
        Map<String, dynamic> json) =>
    CreateUpdateModeRequest(
      name: json['name'] as String,
      costs: json['costs'] as int,
      time: json['time'] as int,
    );

Map<String, dynamic> _$CreateUpdateModeRequestToJson(
        CreateUpdateModeRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'costs': instance.costs,
      'time': instance.time,
    };
