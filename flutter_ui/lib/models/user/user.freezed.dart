// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String user_id,
      required String first_name,
      required String last_name,
      required String cellular_number,
      required String user_role,
      required bool is_active,
      required DateTime creation_timestamp,
      required DateTime modify_timestamp,
      String? email}) {
    return _User(
      user_id: user_id,
      first_name: first_name,
      last_name: last_name,
      cellular_number: cellular_number,
      user_role: user_role,
      is_active: is_active,
      creation_timestamp: creation_timestamp,
      modify_timestamp: modify_timestamp,
      email: email,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get user_id => throw _privateConstructorUsedError;
  String get first_name => throw _privateConstructorUsedError;
  String get last_name => throw _privateConstructorUsedError;
  String get cellular_number => throw _privateConstructorUsedError;
  String get user_role => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  DateTime get creation_timestamp => throw _privateConstructorUsedError;
  DateTime get modify_timestamp => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String user_id,
      String first_name,
      String last_name,
      String cellular_number,
      String user_role,
      bool is_active,
      DateTime creation_timestamp,
      DateTime modify_timestamp,
      String? email});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? user_id = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? cellular_number = freezed,
    Object? user_role = freezed,
    Object? is_active = freezed,
    Object? creation_timestamp = freezed,
    Object? modify_timestamp = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      cellular_number: cellular_number == freezed
          ? _value.cellular_number
          : cellular_number // ignore: cast_nullable_to_non_nullable
              as String,
      user_role: user_role == freezed
          ? _value.user_role
          : user_role // ignore: cast_nullable_to_non_nullable
              as String,
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
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String user_id,
      String first_name,
      String last_name,
      String cellular_number,
      String user_role,
      bool is_active,
      DateTime creation_timestamp,
      DateTime modify_timestamp,
      String? email});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? user_id = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? cellular_number = freezed,
    Object? user_role = freezed,
    Object? is_active = freezed,
    Object? creation_timestamp = freezed,
    Object? modify_timestamp = freezed,
    Object? email = freezed,
  }) {
    return _then(_User(
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      cellular_number: cellular_number == freezed
          ? _value.cellular_number
          : cellular_number // ignore: cast_nullable_to_non_nullable
              as String,
      user_role: user_role == freezed
          ? _value.user_role
          : user_role // ignore: cast_nullable_to_non_nullable
              as String,
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
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {required this.user_id,
      required this.first_name,
      required this.last_name,
      required this.cellular_number,
      required this.user_role,
      required this.is_active,
      required this.creation_timestamp,
      required this.modify_timestamp,
      this.email});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String user_id;
  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String cellular_number;
  @override
  final String user_role;
  @override
  final bool is_active;
  @override
  final DateTime creation_timestamp;
  @override
  final DateTime modify_timestamp;
  @override
  final String? email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(user_id: $user_id, first_name: $first_name, last_name: $last_name, cellular_number: $cellular_number, user_role: $user_role, is_active: $is_active, creation_timestamp: $creation_timestamp, modify_timestamp: $modify_timestamp, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('user_id', user_id))
      ..add(DiagnosticsProperty('first_name', first_name))
      ..add(DiagnosticsProperty('last_name', last_name))
      ..add(DiagnosticsProperty('cellular_number', cellular_number))
      ..add(DiagnosticsProperty('user_role', user_role))
      ..add(DiagnosticsProperty('is_active', is_active))
      ..add(DiagnosticsProperty('creation_timestamp', creation_timestamp))
      ..add(DiagnosticsProperty('modify_timestamp', modify_timestamp))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.user_id, user_id) &&
            const DeepCollectionEquality()
                .equals(other.first_name, first_name) &&
            const DeepCollectionEquality().equals(other.last_name, last_name) &&
            const DeepCollectionEquality()
                .equals(other.cellular_number, cellular_number) &&
            const DeepCollectionEquality().equals(other.user_role, user_role) &&
            const DeepCollectionEquality().equals(other.is_active, is_active) &&
            const DeepCollectionEquality()
                .equals(other.creation_timestamp, creation_timestamp) &&
            const DeepCollectionEquality()
                .equals(other.modify_timestamp, modify_timestamp) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user_id),
      const DeepCollectionEquality().hash(first_name),
      const DeepCollectionEquality().hash(last_name),
      const DeepCollectionEquality().hash(cellular_number),
      const DeepCollectionEquality().hash(user_role),
      const DeepCollectionEquality().hash(is_active),
      const DeepCollectionEquality().hash(creation_timestamp),
      const DeepCollectionEquality().hash(modify_timestamp),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {required String user_id,
      required String first_name,
      required String last_name,
      required String cellular_number,
      required String user_role,
      required bool is_active,
      required DateTime creation_timestamp,
      required DateTime modify_timestamp,
      String? email}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get user_id;
  @override
  String get first_name;
  @override
  String get last_name;
  @override
  String get cellular_number;
  @override
  String get user_role;
  @override
  bool get is_active;
  @override
  DateTime get creation_timestamp;
  @override
  DateTime get modify_timestamp;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
