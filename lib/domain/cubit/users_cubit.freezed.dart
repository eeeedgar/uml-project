// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersState _$UsersStateFromJson(Map<String, dynamic> json) {
  return _UsersState.fromJson(json);
}

/// @nodoc
mixin _$UsersState {
  List<User> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersStateCopyWith<UsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersStateCopyWith<$Res> {
  factory $UsersStateCopyWith(
          UsersState value, $Res Function(UsersState) then) =
      _$UsersStateCopyWithImpl<$Res, UsersState>;
  @useResult
  $Res call({List<User> users});
}

/// @nodoc
class _$UsersStateCopyWithImpl<$Res, $Val extends UsersState>
    implements $UsersStateCopyWith<$Res> {
  _$UsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersStateImplCopyWith<$Res>
    implements $UsersStateCopyWith<$Res> {
  factory _$$UsersStateImplCopyWith(
          _$UsersStateImpl value, $Res Function(_$UsersStateImpl) then) =
      __$$UsersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<User> users});
}

/// @nodoc
class __$$UsersStateImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersStateImpl>
    implements _$$UsersStateImplCopyWith<$Res> {
  __$$UsersStateImplCopyWithImpl(
      _$UsersStateImpl _value, $Res Function(_$UsersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$UsersStateImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersStateImpl implements _UsersState {
  const _$UsersStateImpl({final List<User> users = const []}) : _users = users;

  factory _$UsersStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersStateImplFromJson(json);

  final List<User> _users;
  @override
  @JsonKey()
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'UsersState(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersStateImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersStateImplCopyWith<_$UsersStateImpl> get copyWith =>
      __$$UsersStateImplCopyWithImpl<_$UsersStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersStateImplToJson(
      this,
    );
  }
}

abstract class _UsersState implements UsersState {
  const factory _UsersState({final List<User> users}) = _$UsersStateImpl;

  factory _UsersState.fromJson(Map<String, dynamic> json) =
      _$UsersStateImpl.fromJson;

  @override
  List<User> get users;
  @override
  @JsonKey(ignore: true)
  _$$UsersStateImplCopyWith<_$UsersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
