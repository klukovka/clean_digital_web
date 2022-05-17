import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'repair_company.dart';
import 'repair_type.dart';

part 'repair_product.g.dart';

@immutable
@JsonSerializable()
class RepairProduct extends Equatable {
  @JsonKey(defaultValue: '')
  final String repairProductId;
  final double costs;
  final String description;
  final String repairCompanyId;
  final RepairType type;
  final RepairCompany repairCompany;

  const RepairProduct({
    required this.repairProductId,
    required this.costs,
    required this.description,
    required this.repairCompanyId,
    required this.type,
    this.repairCompany = const RepairCompany.empty(),
  });

  const RepairProduct.empty()
      : repairProductId = '',
        costs = 0,
        description = '',
        repairCompanyId = '',
        type = RepairType.inspection,
        repairCompany = const RepairCompany.empty();

  factory RepairProduct.fromJson(Map<String, dynamic> json) {
    return _$RepairProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepairProductToJson(this);

  @override
  List<Object> get props {
    return [
      repairProductId,
      costs,
      description,
      repairCompanyId,
      type,
      repairCompany,
    ];
  }
}
