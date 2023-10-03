// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComplaintImpl _$$ComplaintImplFromJson(Map<String, dynamic> json) =>
    _$ComplaintImpl(
      id: json['id'] as String,
      description: json['description'] as String,
      solutionId: json['solutionId'] as String,
      orderId: json['orderId'] as String,
      status: $enumDecode(_$ComplaintStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$ComplaintImplToJson(_$ComplaintImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'solutionId': instance.solutionId,
      'orderId': instance.orderId,
      'status': _$ComplaintStatusEnumMap[instance.status]!,
    };

const _$ComplaintStatusEnumMap = {
  ComplaintStatus.created: 'created',
  ComplaintStatus.onReview: 'onReview',
  ComplaintStatus.accepted: 'accepted',
  ComplaintStatus.declined: 'declined',
};
