import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'invitation.freezed.dart';
part 'invitation.g.dart';

@Freezed()
class Invitation with _$Invitation{
  const factory Invitation({
    required String invitation_id,
    required String user_id,
    required int invitees_amount,
    required int invitees_admitted,
    required DateTime invitees_arrival_timestamp,
    required bool is_active,
    required DateTime creation_timestamp,
    required DateTime modify_timestamp,
    String? comment_for_guard,
  }) = _Invitation;



  factory Invitation.fromJson(Map<String, Object?> json)=> _$InvitationFromJson(json);
}