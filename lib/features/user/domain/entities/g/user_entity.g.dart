// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String? ?? null,
      firstName: json['firstName'] as String? ?? null,
      lastName: json['lastName'] as String? ?? null,
      email: json['email'] as String? ?? null,
      emailVerified: json['emailVerified'] as bool? ?? false,
      phone: json['phone'] as String? ?? null,
      photoUrl: json['photoUrl'] as String? ?? null,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'phone': instance.phone,
      'photoUrl': instance.photoUrl,
    };
