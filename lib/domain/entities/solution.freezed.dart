// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Solution _$SolutionFromJson(Map<String, dynamic> json) {
  return _Solution.fromJson(json);
}

/// @nodoc
mixin _$Solution {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get performerId => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  bool get viewed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolutionCopyWith<Solution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolutionCopyWith<$Res> {
  factory $SolutionCopyWith(Solution value, $Res Function(Solution) then) =
      _$SolutionCopyWithImpl<$Res, Solution>;
  @useResult
  $Res call(
      {String id,
      String title,
      String performerId,
      String orderId,
      bool viewed});
}

/// @nodoc
class _$SolutionCopyWithImpl<$Res, $Val extends Solution>
    implements $SolutionCopyWith<$Res> {
  _$SolutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? performerId = null,
    Object? orderId = null,
    Object? viewed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      performerId: null == performerId
          ? _value.performerId
          : performerId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolutionImplCopyWith<$Res>
    implements $SolutionCopyWith<$Res> {
  factory _$$SolutionImplCopyWith(
          _$SolutionImpl value, $Res Function(_$SolutionImpl) then) =
      __$$SolutionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String performerId,
      String orderId,
      bool viewed});
}

/// @nodoc
class __$$SolutionImplCopyWithImpl<$Res>
    extends _$SolutionCopyWithImpl<$Res, _$SolutionImpl>
    implements _$$SolutionImplCopyWith<$Res> {
  __$$SolutionImplCopyWithImpl(
      _$SolutionImpl _value, $Res Function(_$SolutionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? performerId = null,
    Object? orderId = null,
    Object? viewed = null,
  }) {
    return _then(_$SolutionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      performerId: null == performerId
          ? _value.performerId
          : performerId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      viewed: null == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolutionImpl implements _Solution {
  _$SolutionImpl(
      {required this.id,
      required this.title,
      required this.performerId,
      required this.orderId,
      this.viewed = false});

  factory _$SolutionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SolutionImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String performerId;
  @override
  final String orderId;
  @override
  @JsonKey()
  final bool viewed;

  @override
  String toString() {
    return 'Solution(id: $id, title: $title, performerId: $performerId, orderId: $orderId, viewed: $viewed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SolutionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.performerId, performerId) ||
                other.performerId == performerId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.viewed, viewed) || other.viewed == viewed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, performerId, orderId, viewed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolutionImplCopyWith<_$SolutionImpl> get copyWith =>
      __$$SolutionImplCopyWithImpl<_$SolutionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolutionImplToJson(
      this,
    );
  }
}

abstract class _Solution implements Solution {
  factory _Solution(
      {required final String id,
      required final String title,
      required final String performerId,
      required final String orderId,
      final bool viewed}) = _$SolutionImpl;

  factory _Solution.fromJson(Map<String, dynamic> json) =
      _$SolutionImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get performerId;
  @override
  String get orderId;
  @override
  bool get viewed;
  @override
  @JsonKey(ignore: true)
  _$$SolutionImplCopyWith<_$SolutionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
