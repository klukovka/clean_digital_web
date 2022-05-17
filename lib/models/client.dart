// import { User } from './user';

// export class Client {
//   clientId?: string | null;
//   name: string;
//   phone: string;
//   bonuses: number;
//   sale: number;
//   user?: User | null;
//   userId: string;

//   constructor(
//     name: string,
//     phone: string,
//     userId: string,
//     bonuses: number = 0,
//     sale: number = 0,
//     clientId: string | null = null,
//     user: User | null = null
//   ) {
//     this.name = name;
//     this.phone = phone;
//     this.bonuses = bonuses;
//     this.clientId = clientId;
//     this.user = user;
//     this.userId = userId;
//     this.sale = sale;
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'client.g.dart';

@immutable
@JsonSerializable()
class Client extends Equatable {
  @JsonKey(defaultValue: '')
  final String clientId;
  final String name;
  final String phone;
  final double bonuses;
  final double sale;
  final String userId;
  final User user;

  const Client({
    required this.clientId,
    required this.name,
    required this.phone,
    required this.userId,
    required this.bonuses,
    required this.sale,
    this.user = const User.empty(),
  });

  const Client.emply()
      : clientId = '',
        name = '',
        phone = '',
        userId = '',
        bonuses = 0,
        sale = 0,
        user = const User.empty();

  factory Client.fromJson(Map<String, dynamic> json) {
    return _$ClientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClientToJson(this);

  @override
  List<Object> get props {
    return [
      clientId,
      name,
      phone,
      userId,
      bonuses,
      sale,
      user,
    ];
  }
}
