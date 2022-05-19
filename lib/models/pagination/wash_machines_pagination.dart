import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../wash_machine.dart';
import 'pagination.dart';

part 'wash_machines_pagination.g.dart';

@immutable
@JsonSerializable()
class WashMachinesPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<WashMachine> washMachines;

  const WashMachinesPagination({
    required this.washMachines,
    required int page,
    required int size,
    required int totalElements,
    required int totalPages,
  }) : super(
          page: page,
          size: size,
          totalElements: totalElements,
          totalPages: totalPages,
        );

  factory WashMachinesPagination.fromJson(Map<String, dynamic> json) {
    return _$WashMachinesPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WashMachinesPaginationToJson(this);
}
