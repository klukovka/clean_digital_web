import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restore_password_request.g.dart';

@immutable
@JsonSerializable()
class RestorePasswordRequest extends Equatable {
  final String email;

  const RestorePasswordRequest({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}
