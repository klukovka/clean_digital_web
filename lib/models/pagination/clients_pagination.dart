import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../client.dart';
import 'pagination.dart';

part 'clients_pagination.g.dart';

@immutable
@JsonSerializable()
class ClientsPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<Client> clients;

  const ClientsPagination({
    required this.clients,
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

  factory ClientsPagination.fromJson(Map<String, dynamic> json) {
    return _$ClientsPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClientsPaginationToJson(this);
}
