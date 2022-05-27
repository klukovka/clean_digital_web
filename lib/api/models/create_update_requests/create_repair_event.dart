import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_repair_event.g.dart';

@immutable
@JsonSerializable()
class CreateRepairEventRequest extends Equatable {
  final String repairProductId;
  final String washMachineId;

  const CreateRepairEventRequest({
    required this.repairProductId,
    required this.washMachineId,
  });

  factory CreateRepairEventRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateRepairEventRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateRepairEventRequestToJson(this);

  @override
  List<Object?> get props {
    return [
      repairProductId,
      washMachineId,
    ];
  }
}
