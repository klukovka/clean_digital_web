// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      clientId: json['clientId'] as String? ?? '',
      name: json['name'] as String,
      phone: json['phone'] as String,
      userId: json['userId'] as String,
      bonuses: (json['bonuses'] as num).toDouble(),
      sale: (json['sale'] as num).toDouble(),
      user: json['user'] == null
          ? const User.empty()
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'clientId': instance.clientId,
      'name': instance.name,
      'phone': instance.phone,
      'bonuses': instance.bonuses,
      'sale': instance.sale,
      'userId': instance.userId,
      'user': instance.user,
    };
