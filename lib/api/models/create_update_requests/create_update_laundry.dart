import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_update_laundry.g.dart';

@immutable
@JsonSerializable()
class CreateUpdateLaundryRequest extends Equatable {
  final String email;
  final String name;
  final String phone;
  final String address;
  final String? password;
  final int maxAmount;

  const CreateUpdateLaundryRequest({
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
    required this.password,
    required this.maxAmount,
  });

  factory CreateUpdateLaundryRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateUpdateLaundryRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateUpdateLaundryRequestToJson(this);

  @override
  List<Object?> get props {
    return [
      email,
      name,
      phone,
      address,
      password,
      maxAmount,
    ];
  }
}
