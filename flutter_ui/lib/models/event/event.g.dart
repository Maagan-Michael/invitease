// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      event_id: json['event_id'] as String,
      event_type: json['event_type'] as String,
      event_timestamp: DateTime.parse(json['event_timestamp'] as String),
      amount_before: json['amount_before'] as int?,
      amount_after: json['amount_after'] as int?,
      user_id: json['user_id'] as String?,
      guard_id: json['guard_id'] as String?,
      invitation_id: json['invitation_id'] as String?,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'event_id': instance.event_id,
      'event_type': instance.event_type,
      'event_timestamp': instance.event_timestamp.toIso8601String(),
      'amount_before': instance.amount_before,
      'amount_after': instance.amount_after,
      'user_id': instance.user_id,
      'guard_id': instance.guard_id,
      'invitation_id': instance.invitation_id,
    };
