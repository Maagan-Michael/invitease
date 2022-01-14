// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      user_id: json['user_id'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      cellular_number: json['cellular_number'] as String,
      user_role: json['user_role'] as String,
      is_active: json['is_active'] as bool,
      creation_timestamp: DateTime.parse(json['creation_timestamp'] as String),
      modify_timestamp: DateTime.parse(json['modify_timestamp'] as String),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'cellular_number': instance.cellular_number,
      'user_role': instance.user_role,
      'is_active': instance.is_active,
      'creation_timestamp': instance.creation_timestamp.toIso8601String(),
      'modify_timestamp': instance.modify_timestamp.toIso8601String(),
      'email': instance.email,
    };
