import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_update_mode.g.dart';

@immutable
@JsonSerializable()
class CreateUpdateModeRequest extends Equatable {
  final String name;
  final int costs;
  final int time;

  const CreateUpdateModeRequest({
    required this.name,
    required this.costs,
    required this.time,
  });

  factory CreateUpdateModeRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateUpdateModeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateUpdateModeRequestToJson(this);

  @override
  List<Object> get props {
    return [
      name,
      costs,
      time,
    ];
  }
}
