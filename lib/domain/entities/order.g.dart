// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      customerId: json['customerId'] as String,
      currentPerformerId: json['currentPerformerId'] as String?,
      price: json['price'] as int,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'customerId': instance.customerId,
      'currentPerformerId': instance.currentPerformerId,
      'price': instance.price,
      'status': _$OrderStatusEnumMap[instance.status]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.created: 'created',
  OrderStatus.inProcess: 'inProcess',
  OrderStatus.readyToReview: 'readyToReview',
  OrderStatus.hasComplaint: 'hasComplaint',
  OrderStatus.done: 'done',
  OrderStatus.closed: 'closed',
};
