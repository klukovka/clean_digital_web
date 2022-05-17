import 'package:json_annotation/json_annotation.dart';

enum RepairType {
  @JsonValue('REPAIR')
  repair,
  @JsonValue('INSPECTION')
  inspection,
  @JsonValue('SOFTWARE')
  software;
}
