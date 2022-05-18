import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'backup.g.dart';

@immutable
@JsonSerializable()
class Backup extends Equatable {
  final List<String> backups;

  const Backup({
    required this.backups,
  });

  factory Backup.fromJson(Map<String, dynamic> json) {
    return _$BackupFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BackupToJson(this);

  @override
  List<Object> get props => [backups];
}
