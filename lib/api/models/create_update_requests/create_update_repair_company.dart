import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_update_repair_company.g.dart';

@immutable
@JsonSerializable()
class CreateUpdateRepairCompanyRequest extends Equatable {
  final String email;
  final String name;
  final String phone;
  final String address;
  final String? password;

  const CreateUpdateRepairCompanyRequest({
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
    required this.password,
  });

  factory CreateUpdateRepairCompanyRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateUpdateRepairCompanyRequestFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$CreateUpdateRepairCompanyRequestToJson(this);

  @override
  List<Object?> get props {
    return [
      email,
      name,
      phone,
      address,
      password,
    ];
  }
}
