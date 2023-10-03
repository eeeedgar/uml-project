// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solutions_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolutionsStateImpl _$$SolutionsStateImplFromJson(Map<String, dynamic> json) =>
    _$SolutionsStateImpl(
      solutions: (json['solutions'] as List<dynamic>?)
              ?.map((e) => Solution.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SolutionsStateImplToJson(
        _$SolutionsStateImpl instance) =>
    <String, dynamic>{
      'solutions': instance.solutions,
    };
