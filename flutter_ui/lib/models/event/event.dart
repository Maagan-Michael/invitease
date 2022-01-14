import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'event.freezed.dart';
part 'event.g.dart';

@Freezed()
class Event with _$Event{
  const factory Event({
    required String event_id,
    required String event_type,
    required DateTime event_timestamp,
    int? amount_before,
    int? amount_after,
    String? user_id,
    String? guard_id,
    String? invitation_id,
  }) = _Event;



  factory Event.fromJson(Map<String, dynamic> json)=> _$EventFromJson(json);
}