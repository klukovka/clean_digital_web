import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'repair_company.g.dart';

@immutable
@JsonSerializable()
class RepairCompany extends Equatable {
  @JsonKey(defaultValue: '')
  final String repairCompanyId;
  final String name;
  final String phone;
  final String address;
  final String userId;
  final User user;

  const RepairCompany({
    required this.repairCompanyId,
    required this.name,
    required this.phone,
    required this.address,
    required this.userId,
    this.user = const User.empty(),
  });

  const RepairCompany.empty()
      : repairCompanyId = '',
        name = '',
        phone = '',
        address = '',
        userId = '',
        user = const User.empty();

  factory RepairCompany.fromJson(Map<String, dynamic> json) {
    return _$RepairCompanyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepairCompanyToJson(this);

  @override
  List<Object?> get props {
    return [
      repairCompanyId,
      name,
      phone,
      address,
      userId,
      user,
    ];
  }
}
