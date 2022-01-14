// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Invitation _$InvitationFromJson(Map<String, dynamic> json) {
  return _Invitation.fromJson(json);
}

/// @nodoc
class _$InvitationTearOff {
  const _$InvitationTearOff();

  _Invitation call(
      {required String invitation_id,
      required String user_id,
      required int invitees_amount,
      required int invitees_admitted,
      required DateTime invitees_arrival_timestamp,
      required bool is_active,
      required DateTime creation_timestamp,
      required DateTime modify_timestamp,
      String? comment_for_guard}) {
    return _Invitation(
      invitation_id: invitation_id,
      user_id: user_id,
      invitees_amount: invitees_amount,
      invitees_admitted: invitees_admitted,
      invitees_arrival_timestamp: invitees_arrival_timestamp,
      is_active: is_active,
      creation_timestamp: creation_timestamp,
      modify_timestamp: modify_timestamp,
      comment_for_guard: comment_for_guard,
    );
  }

  Invitation fromJson(Map<String, Object?> json) {
    return Invitation.fromJson(json);
  }
}

/// @nodoc
const $Invitation = _$InvitationTearOff();

/// @nodoc
mixin _$Invitation {
  String get invitation_id => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;
  int get invitees_amount => throw _privateConstructorUsedError;
  int get invitees_admitted => throw _privateConstructorUsedError;
  DateTime get invitees_arrival_timestamp => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  DateTime get creation_timestamp => throw _privateConstructorUsedError;
  DateTime get modify_timestamp => throw _privateConstructorUsedError;
  String? get comment_for_guard => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationCopyWith<Invitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationCopyWith<$Res> {
  factory $InvitationCopyWith(
          Invitation value, $Res Function(Invitation) then) =
      _$InvitationCopyWithImpl<$Res>;
  $Res call(
      {String invitation_id,
      String user_id,
      int invitees_amount,
      int invitees_admitted,
      DateTime invitees_arrival_timestamp,
      bool is_active,
      DateTime creation_timestamp,
      DateTime modify_timestamp,
      String? comment_for_guard});
}

/// @nodoc
class _$InvitationCopyWithImpl<$Res> implements $InvitationCopyWith<$Res> {
  _$InvitationCopyWithImpl(this._value, this._then);

  final Invitation _value;
  // ignore: unused_field
  final $Res Function(Invitation) _then;

  @override
  $Res call({
    Object? invitation_id = freezed,
    Object? user_id = freezed,
    Object? invitees_amount = freezed,
    Object? invitees_admitted = freezed,
    Object? invitees_arrival_timestamp = freezed,
    Object? is_active = freezed,
    Object? creation_timestamp = freezed,
    Object? modify_timestamp = freezed,
    Object? comment_for_guard = freezed,
  }) {
    return _then(_value.copyWith(
      invitation_id: invitation_id == freezed
          ? _value.invitation_id
          : invitation_id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      invitees_amount: invitees_amount == freezed
          ? _value.invitees_amount
          : invitees_amount // ignore: cast_nullable_to_non_nullable
              as int,
      invitees_admitted: invitees_admitted == freezed
          ? _value.invitees_admitted
          : invitees_admitted // ignore: cast_nullable_to_non_nullable
              as int,
      invitees_arrival_timestamp: invitees_arrival_timestamp == freezed
          ? _value.invitees_arrival_timestamp
          : invitees_arrival_timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      is_active: is_active == freezed
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      creation_timestamp: creation_timestamp == freezed
          ? _value.creation_timestamp
          : creation_timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modify_timestamp: modify_timestamp == freezed
          ? _value.modify_timestamp
          : modify_timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment_for_guard: comment_for_guard == freezed
          ? _value.comment_for_guard
          : comment_for_guard // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$InvitationCopyWith<$Res> implements $InvitationCopyWith<$Res> {
  factory _$InvitationCopyWith(
          _Invitation value, $Res Function(_Invitation) then) =
      __$InvitationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String invitation_id,
      String user_id,
      int invitees_amount,
      int invitees_admitted,
      DateTime invitees_arrival_timestamp,
      bool is_active,
      DateTime creation_timestamp,
      DateTime modify_timestamp,
      String? comment_for_guard});
}

/// @nodoc
class __$InvitationCopyWithImpl<$Res> extends _$InvitationCopyWithImpl<$Res>
    implements _$InvitationCopyWith<$Res> {
  __$InvitationCopyWithImpl(
      _Invitation _value, $Res Function(_Invitation) _then)
      : super(_value, (v) => _then(v as _Invitation));

  @override
  _Invitation get _value => super._value as _Invitation;

  @override
  $Res call({
    Object? invitation_id = freezed,
    Object? user_id = freezed,
    Object? invitees_amount = freezed,
    Object? invitees_admitted = freezed,
    Object? invitees_arrival_timestamp = freezed,
    Object? is_active = freezed,
    Object? creation_timestamp = freezed,
    Object? modify_timestamp = freezed,
    Object? comment_for_guard = freezed,
  }) {
    return _then(_Invitation(
      invitation_id: invitation_id == freezed
          ? _value.invitation_id
          : invitation_id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      invitees_amount: invitees_amount == freezed
          ? _value.invitees_amount
          : invitees_amount // ignore: cast_nullable_to_non_nullable
              as int,
      invitees_admitted: invitees_admitted == freezed
          ? _value.invitees_admitted
          : invitees_admitted // ignore: cast_nullable_to_non_nullable
              as int,
      invitees_arrival_timestamp: invitees_arrival_timestamp == freezed
          ? _value.invitees_arrival_timestamp
          : invitees_arrival_timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      is_active: is_active == freezed
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      creation_timestamp: creation_timestamp == freezed
          ? _value.creation_timestamp
          : creation_timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modify_timestamp: modify_timestamp == freezed
          ? _value.modify_timestamp
          : modify_timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment_for_guard: comment_for_guard == freezed
          ? _value.comment_for_guard
          : comment_for_guard // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Invitation with DiagnosticableTreeMixin implements _Invitation {
  const _$_Invitation(
      {required this.invitation_id,
      required this.user_id,
      required this.invitees_amount,
      required this.invitees_admitted,
      required this.invitees_arrival_timestamp,
      required this.is_active,
      required this.creation_timestamp,
      required this.modify_timestamp,
      this.comment_for_guard});

  factory _$_Invitation.fromJson(Map<String, dynamic> json) =>
      _$$_InvitationFromJson(json);

  @override
  final String invitation_id;
  @override
  final String user_id;
  @override
  final int invitees_amount;
  @override
  final int invitees_admitted;
  @override
  final DateTime invitees_arrival_timestamp;
  @override
  final bool is_active;
  @override
  final DateTime creation_timestamp;
  @override
  final DateTime modify_timestamp;
  @override
  final String? comment_for_guard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Invitation(invitation_id: $invitation_id, user_id: $user_id, invitees_amount: $invitees_amount, invitees_admitted: $invitees_admitted, invitees_arrival_timestamp: $invitees_arrival_timestamp, is_active: $is_active, creation_timestamp: $creation_timestamp, modify_timestamp: $modify_timestamp, comment_for_guard: $comment_for_guard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Invitation'))
      ..add(DiagnosticsProperty('invitation_id', invitation_id))
      ..add(DiagnosticsProperty('user_id', user_id))
      ..add(DiagnosticsProperty('invitees_amount', invitees_amount))
      ..add(DiagnosticsProperty('invitees_admitted', invitees_admitted))
      ..add(DiagnosticsProperty(
          'invitees_arrival_timestamp', invitees_arrival_timestamp))
      ..add(DiagnosticsProperty('is_active', is_active))
      ..add(DiagnosticsProperty('creation_timestamp', creation_timestamp))
      ..add(DiagnosticsProperty('modify_timestamp', modify_timestamp))
      ..add(DiagnosticsProperty('comment_for_guard', comment_for_guard));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Invitation &&
            const DeepCollectionEquality()
                .equals(other.invitation_id, invitation_id) &&
            const DeepCollectionEquality().equals(other.user_id, user_id) &&
            const DeepCollectionEquality()
                .equals(other.invitees_amount, invitees_amount) &&
            const DeepCollectionEquality()
                .equals(other.invitees_admitted, invitees_admitted) &&
            const DeepCollectionEquality().equals(
                other.invitees_arrival_timestamp, invitees_arrival_timestamp) &&
            const DeepCollectionEquality().equals(other.is_active, is_active) &&
            const DeepCollectionEquality()
                .equals(other.creation_timestamp, creation_timestamp) &&
            const DeepCollectionEquality()
                .equals(other.modify_timestamp, modify_timestamp) &&
            const DeepCollectionEquality()
                .equals(other.comment_for_guard, comment_for_guard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(invitation_id),
      const DeepCollectionEquality().hash(user_id),
      const DeepCollectionEquality().hash(invitees_amount),
      const DeepCollectionEquality().hash(invitees_admitted),
      const DeepCollectionEquality().hash(invitees_arrival_timestamp),
      const DeepCollectionEquality().hash(is_active),
      const DeepCollectionEquality().hash(creation_timestamp),
      const DeepCollectionEquality().hash(modify_timestamp),
      const DeepCollectionEquality().hash(comment_for_guard));

  @JsonKey(ignore: true)
  @override
  _$InvitationCopyWith<_Invitation> get copyWith =>
      __$InvitationCopyWithImpl<_Invitation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvitationToJson(this);
  }
}

abstract class _Invitation implements Invitation {
  const factory _Invitation(
      {required String invitation_id,
      required String user_id,
      required int invitees_amount,
      required int invitees_admitted,
      required DateTime invitees_arrival_timestamp,
      required bool is_active,
      required DateTime creation_timestamp,
      required DateTime modify_timestamp,
      String? comment_for_guard}) = _$_Invitation;

  factory _Invitation.fromJson(Map<String, dynamic> json) =
      _$_Invitation.fromJson;

  @override
  String get invitation_id;
  @override
  String get user_id;
  @override
  int get invitees_amount;
  @override
  int get invitees_admitted;
  @override
  DateTime get invitees_arrival_timestamp;
  @override
  bool get is_active;
  @override
  DateTime get creation_timestamp;
  @override
  DateTime get modify_timestamp;
  @override
  String? get comment_for_guard;
  @override
  @JsonKey(ignore: true)
  _$InvitationCopyWith<_Invitation> get copyWith =>
      throw _privateConstructorUsedError;
}
