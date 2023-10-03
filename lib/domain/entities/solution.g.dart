// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolutionImpl _$$SolutionImplFromJson(Map<String, dynamic> json) =>
    _$SolutionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      performerId: json['performerId'] as String,
      orderId: json['orderId'] as String,
      viewed: json['viewed'] as bool? ?? false,
    );

Map<String, dynamic> _$$SolutionImplToJson(_$SolutionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'performerId': instance.performerId,
      'orderId': instance.orderId,
      'viewed': instance.viewed,
    };
