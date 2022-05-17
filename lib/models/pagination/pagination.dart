import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@immutable
@JsonSerializable()
class Pagination extends Equatable {
  final int page;
  final int size;
  final int totalPages;
  final int totalElements;

  const Pagination({
    required this.page,
    required this.size,
    required this.totalPages,
    required this.totalElements,
  });

  @override
  List<Object> get props => [page, size, totalPages, totalElements];
}
