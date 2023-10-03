// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complaints_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComplaintsState _$ComplaintsStateFromJson(Map<String, dynamic> json) {
  return _ComplaintsState.fromJson(json);
}

/// @nodoc
mixin _$ComplaintsState {
  List<Complaint> get complaints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplaintsStateCopyWith<ComplaintsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplaintsStateCopyWith<$Res> {
  factory $ComplaintsStateCopyWith(
          ComplaintsState value, $Res Function(ComplaintsState) then) =
      _$ComplaintsStateCopyWithImpl<$Res, ComplaintsState>;
  @useResult
  $Res call({List<Complaint> complaints});
}

/// @nodoc
class _$ComplaintsStateCopyWithImpl<$Res, $Val extends ComplaintsState>
    implements $ComplaintsStateCopyWith<$Res> {
  _$ComplaintsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaints = null,
  }) {
    return _then(_value.copyWith(
      complaints: null == complaints
          ? _value.complaints
          : complaints // ignore: cast_nullable_to_non_nullable
              as List<Complaint>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComplaintsStateImplCopyWith<$Res>
    implements $ComplaintsStateCopyWith<$Res> {
  factory _$$ComplaintsStateImplCopyWith(_$ComplaintsStateImpl value,
          $Res Function(_$ComplaintsStateImpl) then) =
      __$$ComplaintsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Complaint> complaints});
}

/// @nodoc
class __$$ComplaintsStateImplCopyWithImpl<$Res>
    extends _$ComplaintsStateCopyWithImpl<$Res, _$ComplaintsStateImpl>
    implements _$$ComplaintsStateImplCopyWith<$Res> {
  __$$ComplaintsStateImplCopyWithImpl(
      _$ComplaintsStateImpl _value, $Res Function(_$ComplaintsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaints = null,
  }) {
    return _then(_$ComplaintsStateImpl(
      complaints: null == complaints
          ? _value._complaints
          : complaints // ignore: cast_nullable_to_non_nullable
              as List<Complaint>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComplaintsStateImpl implements _ComplaintsState {
  const _$ComplaintsStateImpl({final List<Complaint> complaints = const []})
      : _complaints = complaints;

  factory _$ComplaintsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplaintsStateImplFromJson(json);

  final List<Complaint> _complaints;
  @override
  @JsonKey()
  List<Complaint> get complaints {
    if (_complaints is EqualUnmodifiableListView) return _complaints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_complaints);
  }

  @override
  String toString() {
    return 'ComplaintsState(complaints: $complaints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._complaints, _complaints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_complaints));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintsStateImplCopyWith<_$ComplaintsStateImpl> get copyWith =>
      __$$ComplaintsStateImplCopyWithImpl<_$ComplaintsStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplaintsStateImplToJson(
      this,
    );
  }
}

abstract class _ComplaintsState implements ComplaintsState {
  const factory _ComplaintsState({final List<Complaint> complaints}) =
      _$ComplaintsStateImpl;

  factory _ComplaintsState.fromJson(Map<String, dynamic> json) =
      _$ComplaintsStateImpl.fromJson;

  @override
  List<Complaint> get complaints;
  @override
  @JsonKey(ignore: true)
  _$$ComplaintsStateImplCopyWith<_$ComplaintsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
