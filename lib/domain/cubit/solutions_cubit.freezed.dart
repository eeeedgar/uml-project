// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solutions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolutionsState _$SolutionsStateFromJson(Map<String, dynamic> json) {
  return _SolutionsState.fromJson(json);
}

/// @nodoc
mixin _$SolutionsState {
  List<Solution> get solutions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolutionsStateCopyWith<SolutionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolutionsStateCopyWith<$Res> {
  factory $SolutionsStateCopyWith(
          SolutionsState value, $Res Function(SolutionsState) then) =
      _$SolutionsStateCopyWithImpl<$Res, SolutionsState>;
  @useResult
  $Res call({List<Solution> solutions});
}

/// @nodoc
class _$SolutionsStateCopyWithImpl<$Res, $Val extends SolutionsState>
    implements $SolutionsStateCopyWith<$Res> {
  _$SolutionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solutions = null,
  }) {
    return _then(_value.copyWith(
      solutions: null == solutions
          ? _value.solutions
          : solutions // ignore: cast_nullable_to_non_nullable
              as List<Solution>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolutionsStateImplCopyWith<$Res>
    implements $SolutionsStateCopyWith<$Res> {
  factory _$$SolutionsStateImplCopyWith(_$SolutionsStateImpl value,
          $Res Function(_$SolutionsStateImpl) then) =
      __$$SolutionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Solution> solutions});
}

/// @nodoc
class __$$SolutionsStateImplCopyWithImpl<$Res>
    extends _$SolutionsStateCopyWithImpl<$Res, _$SolutionsStateImpl>
    implements _$$SolutionsStateImplCopyWith<$Res> {
  __$$SolutionsStateImplCopyWithImpl(
      _$SolutionsStateImpl _value, $Res Function(_$SolutionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solutions = null,
  }) {
    return _then(_$SolutionsStateImpl(
      solutions: null == solutions
          ? _value._solutions
          : solutions // ignore: cast_nullable_to_non_nullable
              as List<Solution>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolutionsStateImpl implements _SolutionsState {
  const _$SolutionsStateImpl({final List<Solution> solutions = const []})
      : _solutions = solutions;

  factory _$SolutionsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SolutionsStateImplFromJson(json);

  final List<Solution> _solutions;
  @override
  @JsonKey()
  List<Solution> get solutions {
    if (_solutions is EqualUnmodifiableListView) return _solutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_solutions);
  }

  @override
  String toString() {
    return 'SolutionsState(solutions: $solutions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SolutionsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._solutions, _solutions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_solutions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolutionsStateImplCopyWith<_$SolutionsStateImpl> get copyWith =>
      __$$SolutionsStateImplCopyWithImpl<_$SolutionsStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolutionsStateImplToJson(
      this,
    );
  }
}

abstract class _SolutionsState implements SolutionsState {
  const factory _SolutionsState({final List<Solution> solutions}) =
      _$SolutionsStateImpl;

  factory _SolutionsState.fromJson(Map<String, dynamic> json) =
      _$SolutionsStateImpl.fromJson;

  @override
  List<Solution> get solutions;
  @override
  @JsonKey(ignore: true)
  _$$SolutionsStateImplCopyWith<_$SolutionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
