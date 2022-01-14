// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Invitation _$$_InvitationFromJson(Map<String, dynamic> json) =>
    _$_Invitation(
      invitation_id: json['invitation_id'] as String,
      user_id: json['user_id'] as String,
      invitees_amount: json['invitees_amount'] as int,
      invitees_admitted: json['invitees_admitted'] as int,
      invitees_arrival_timestamp:
          DateTime.parse(json['invitees_arrival_timestamp'] as String),
      is_active: json['is_active'] as bool,
      creation_timestamp: DateTime.parse(json['creation_timestamp'] as String),
      modify_timestamp: DateTime.parse(json['modify_timestamp'] as String),
      comment_for_guard: json['comment_for_guard'] as String?,
    );

Map<String, dynamic> _$$_InvitationToJson(_$_Invitation instance) =>
    <String, dynamic>{
      'invitation_id': instance.invitation_id,
      'user_id': instance.user_id,
      'invitees_amount': instance.invitees_amount,
      'invitees_admitted': instance.invitees_admitted,
      'invitees_arrival_timestamp':
          instance.invitees_arrival_timestamp.toIso8601String(),
      'is_active': instance.is_active,
      'creation_timestamp': instance.creation_timestamp.toIso8601String(),
      'modify_timestamp': instance.modify_timestamp.toIso8601String(),
      'comment_for_guard': instance.comment_for_guard,
    };
