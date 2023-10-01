import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uml_freelance/domain/entities/order_status.dart';

part 'order.freezed.dart';

part 'order.g.dart';

@freezed
class Order with _$Order {
  factory Order({
    required final String id,
    required final String title,
    required final String customerId,
    final String? currentPerformerId,
    required final int price,
    required OrderStatus status,
  }) = _Order;

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
}
