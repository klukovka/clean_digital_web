import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_update_employee.g.dart';

@immutable
@JsonSerializable()
class CreateUpdateEmployeeRequest extends Equatable {
  final String email;
  final String name;
  final String phone;
  final String? password;
  final DateTime birthday;

  const CreateUpdateEmployeeRequest({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
    required this.birthday,
  });

  factory CreateUpdateEmployeeRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateUpdateEmployeeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateUpdateEmployeeRequestToJson(this);

  @override
  List<Object?> get props {
    return [
      email,
      name,
      phone,
      password,
      birthday,
    ];
  }
}
