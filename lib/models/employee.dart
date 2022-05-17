// import { Laundry } from './laundry';
// import { User } from './user';

// export class Employee {
//   employeeId?: string | null;
//   name: string;
//   phone: string;
//   birthday: Date;
//   laundry?: Laundry | null;
//   laundryId: string;
//   user?: User | null;
//   userId: string;

//   constructor(
//     name: string,
//     phone: string,
//     birthday: Date,
//     laundryId: string,
//     userId: string,
//     employeeId: string | null = null,
//     laundry: Laundry | null = null,
//     user: User | null = null
//   ) {
//     this.name = name;
//     this.phone = phone;
//     this.birthday = birthday;
//     this.employeeId = employeeId;
//     this.user = user;
//     this.laundryId = laundryId;
//     this.laundry = laundry;
//     this.userId = userId;
//   }
// }
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'laundry.dart';
import 'user.dart';

part 'employee.g.dart';

@immutable
@JsonSerializable()
class Employee extends Equatable {
  @JsonKey(defaultValue: '')
  final String employeeId;
  final String name;
  final String phone;
  final DateTime birthday;
  final String userId;
  final User user;
  final String laundryId;
  final Laundry laundry;

  const Employee({
    required this.employeeId,
    required this.name,
    required this.phone,
    required this.birthday,
    required this.userId,
    required this.laundryId,
    this.user = const User.empty(),
    this.laundry = const Laundry.empty(),
  });

  Employee.empty()
      : employeeId = '',
        name = '',
        phone = '',
        birthday = DateTime.now(),
        userId = '',
        laundryId = '',
        user = const User.empty(),
        laundry = const Laundry.empty();

  factory Employee.fromJson(Map<String, dynamic> json) {
    return _$EmployeeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  @override
  List<Object> get props {
    return [
      employeeId,
      name,
      phone,
      birthday,
      userId,
      user,
      laundryId,
      laundry,
    ];
  }
}
