// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersStateImpl _$$UsersStateImplFromJson(Map<String, dynamic> json) =>
    _$UsersStateImpl(
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UsersStateImplToJson(_$UsersStateImpl instance) =>
    <String, dynamic>{
      'users': instance.users,
    };
