part of 'orders_cubit.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    @Default([]) final List<Order> orders,
  }) = _OrdersState;

  factory OrdersState.fromJson(Map<String, Object?> json) =>
      _$OrdersStateFromJson(json);
}

