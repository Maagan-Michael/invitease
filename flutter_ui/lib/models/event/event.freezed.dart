// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {required String event_id,
      required String event_type,
      required DateTime event_timestamp,
      int? amount_before,
      int? amount_after,
      String? user_id,
      String? guard_id,
      String? invitation_id}) {
    return _Event(
      event_id: event_id,
      event_type: event_type,
      event_timestamp: event_timestamp,
      amount_before: amount_before,
      amount_after: amount_after,
      user_id: user_id,
      guard_id: guard_id,
      invitation_id: invitation_id,
    );
  }

  Event fromJson(Map<String, Object?> json) {
    return Event.fromJson(json);
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  String get event_id => throw _privateConstructorUsedError;
  String get event_type => throw _privateConstructorUsedError;
  DateTime get event_timestamp => throw _privateConstructorUsedError;
  int? get amount_before => throw _privateConstructorUsedError;
  int? get amount_after => throw _privateConstructorUsedError;
  String? get user_id => throw _privateConstructorUsedError;
  String? get guard_id => throw _privateConstructorUsedError;
  String? get invitation_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {String event_id,
      String event_type,
      DateTime event_timestamp,
      int? amount_before,
      int? amount_after,
      String? user_id,
      String? guard_id,
      String? invitation_id});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? event_id = freezed,
    Object? event_type = freezed,
    Object? event_timestamp = freezed,
    Object? amount_before = freezed,
    Object? amount_after = freezed,
    Object? user_id = freezed,
    Object? guard_id = freezed,
    Object? invitation_id = freezed,
  }) {
    return _then(_value.copyWith(
      event_id: event_id == freezed
          ? _value.event_id
          : event_id // ignore: cast_nullable_to_non_nullable
              as String,
      event_type: event_type == freezed
          ? _value.event_type
          : event_type // ignore: cast_nullable_to_non_nullable
              as String,
      event_timestamp: event_timestamp == freezed
          ? _value.event_timestamp
          : event_timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount_before: amount_before == freezed
          ? _value.amount_before
          : amount_before // ignore: cast_nullable_to_non_nullable
              as int?,
      amount_after: amount_after == freezed
          ? _value.amount_after
          : amount_after // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      guard_id: guard_id == freezed
          ? _value.guard_id
          : guard_id // ignore: cast_nullable_to_non_nullable
              as String?,
      invitation_id: invitation_id == freezed
          ? _value.invitation_id
          : invitation_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String event_id,
      String event_type,
      DateTime event_timestamp,
      int? amount_before,
      int? amount_after,
      String? user_id,
      String? guard_id,
      String? invitation_id});
}

/// @nodoc
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? event_id = freezed,
    Object? event_type = freezed,
    Object? event_timestamp = freezed,
    Object? amount_before = freezed,
    Object? amount_after = freezed,
    Object? user_id = freezed,
    Object? guard_id = freezed,
    Object? invitation_id = freezed,
  }) {
    return _then(_Event(
      event_id: event_id == freezed
          ? _value.event_id
          : event_id // ignore: cast_nullable_to_non_nullable
              as String,
      event_type: event_type == freezed
          ? _value.event_type
          : event_type // ignore: cast_nullable_to_non_nullable
              as String,
      event_timestamp: event_timestamp == freezed
          ? _value.event_timestamp
          : event_timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount_before: amount_before == freezed
          ? _value.amount_before
          : amount_before // ignore: cast_nullable_to_non_nullable
              as int?,
      amount_after: amount_after == freezed
          ? _value.amount_after
          : amount_after // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      guard_id: guard_id == freezed
          ? _value.guard_id
          : guard_id // ignore: cast_nullable_to_non_nullable
              as String?,
      invitation_id: invitation_id == freezed
          ? _value.invitation_id
          : invitation_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event with DiagnosticableTreeMixin implements _Event {
  const _$_Event(
      {required this.event_id,
      required this.event_type,
      required this.event_timestamp,
      this.amount_before,
      this.amount_after,
      this.user_id,
      this.guard_id,
      this.invitation_id});

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  final String event_id;
  @override
  final String event_type;
  @override
  final DateTime event_timestamp;
  @override
  final int? amount_before;
  @override
  final int? amount_after;
  @override
  final String? user_id;
  @override
  final String? guard_id;
  @override
  final String? invitation_id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(event_id: $event_id, event_type: $event_type, event_timestamp: $event_timestamp, amount_before: $amount_before, amount_after: $amount_after, user_id: $user_id, guard_id: $guard_id, invitation_id: $invitation_id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('event_id', event_id))
      ..add(DiagnosticsProperty('event_type', event_type))
      ..add(DiagnosticsProperty('event_timestamp', event_timestamp))
      ..add(DiagnosticsProperty('amount_before', amount_before))
      ..add(DiagnosticsProperty('amount_after', amount_after))
      ..add(DiagnosticsProperty('user_id', user_id))
      ..add(DiagnosticsProperty('guard_id', guard_id))
      ..add(DiagnosticsProperty('invitation_id', invitation_id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Event &&
            const DeepCollectionEquality().equals(other.event_id, event_id) &&
            const DeepCollectionEquality()
                .equals(other.event_type, event_type) &&
            const DeepCollectionEquality()
                .equals(other.event_timestamp, event_timestamp) &&
            const DeepCollectionEquality()
                .equals(other.amount_before, amount_before) &&
            const DeepCollectionEquality()
                .equals(other.amount_after, amount_after) &&
            const DeepCollectionEquality().equals(other.user_id, user_id) &&
            const DeepCollectionEquality().equals(other.guard_id, guard_id) &&
            const DeepCollectionEquality()
                .equals(other.invitation_id, invitation_id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(event_id),
      const DeepCollectionEquality().hash(event_type),
      const DeepCollectionEquality().hash(event_timestamp),
      const DeepCollectionEquality().hash(amount_before),
      const DeepCollectionEquality().hash(amount_after),
      const DeepCollectionEquality().hash(user_id),
      const DeepCollectionEquality().hash(guard_id),
      const DeepCollectionEquality().hash(invitation_id));

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(this);
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {required String event_id,
      required String event_type,
      required DateTime event_timestamp,
      int? amount_before,
      int? amount_after,
      String? user_id,
      String? guard_id,
      String? invitation_id}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get event_id;
  @override
  String get event_type;
  @override
  DateTime get event_timestamp;
  @override
  int? get amount_before;
  @override
  int? get amount_after;
  @override
  String? get user_id;
  @override
  String? get guard_id;
  @override
  String? get invitation_id;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}
