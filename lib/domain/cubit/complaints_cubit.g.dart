// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaints_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComplaintsStateImpl _$$ComplaintsStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ComplaintsStateImpl(
      complaints: (json['complaints'] as List<dynamic>?)
              ?.map((e) => Complaint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ComplaintsStateImplToJson(
        _$ComplaintsStateImpl instance) =>
    <String, dynamic>{
      'complaints': instance.complaints,
    };
