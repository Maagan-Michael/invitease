import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User{
  const factory User({
    required String user_id,
    required String first_name,
    required String last_name,
    required String cellular_number,
    required String user_role,
    required bool is_active,
    required DateTime creation_timestamp,
    required DateTime modify_timestamp,
    String? email,
  }) = _User;



  factory User.fromJson(Map<String, dynamic> json)=> _$UserFromJson(json);
}