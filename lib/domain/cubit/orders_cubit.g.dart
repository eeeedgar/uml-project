// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrdersStateImpl _$$OrdersStateImplFromJson(Map<String, dynamic> json) =>
    _$OrdersStateImpl(
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OrdersStateImplToJson(_$OrdersStateImpl instance) =>
    <String, dynamic>{
      'orders': instance.orders,
    };
