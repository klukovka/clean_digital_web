// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_update_laundry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUpdateLaundryRequest _$CreateUpdateLaundryRequestFromJson(
        Map<String, dynamic> json) =>
    CreateUpdateLaundryRequest(
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      password: json['password'] as String?,
      maxAmount: json['maxAmount'] as int,
    );

Map<String, dynamic> _$CreateUpdateLaundryRequestToJson(
        CreateUpdateLaundryRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'password': instance.password,
      'maxAmount': instance.maxAmount,
    };
