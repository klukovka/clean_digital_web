import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_password_request.g.dart';

@immutable
@JsonSerializable()
class UpdatePasswordRequest extends Equatable {
  final String newPassword;
  final String password;

  const UpdatePasswordRequest({
    required this.newPassword,
    required this.password,
  });

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdatePasswordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);

  @override
  List<Object> get props => [newPassword, password];
}
