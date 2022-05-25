import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_update_wash_machine.g.dart';

@immutable
@JsonSerializable()
class CreateUpdateWashMachineRequest extends Equatable {
  final String model;
  final String manufacturer;
  final int capacity;
  final int powerUsage;
  final int spinningSpeed;
  final int maxTime;

  const CreateUpdateWashMachineRequest({
    required this.model,
    required this.manufacturer,
    required this.capacity,
    required this.powerUsage,
    required this.spinningSpeed,
    required this.maxTime,
  });

  factory CreateUpdateWashMachineRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateUpdateWashMachineRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateUpdateWashMachineRequestToJson(this);

  @override
  List<Object> get props {
    return [
      model,
      manufacturer,
      capacity,
      powerUsage,
      spinningSpeed,
      maxTime,
    ];
  }
}
