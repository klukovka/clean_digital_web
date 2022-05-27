import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../models/repair_type.dart';

part 'create_update_repair_product.g.dart';

@immutable
@JsonSerializable()
class CreateUpdateRepairProductRequest extends Equatable {
  final String description;
  final RepairType type;
  final int costs;

  const CreateUpdateRepairProductRequest({
    required this.description,
    required this.type,
    required this.costs,
  });

  factory CreateUpdateRepairProductRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateUpdateRepairProductRequestFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$CreateUpdateRepairProductRequestToJson(this);

  @override
  List<Object?> get props {
    return [
      description,
      type,
      costs,
    ];
  }
}
