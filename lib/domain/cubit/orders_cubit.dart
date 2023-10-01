import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uml_freelance/domain/dto/order_dto.dart';
import 'package:uml_freelance/domain/entities/order.dart';
import 'package:uml_freelance/domain/entities/order_status.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';
part 'orders_cubit.g.dart';

class OrdersCubit extends HydratedCubit<OrdersState> {
  OrdersCubit() : super(const OrdersState());

  List<Order> getOrdersForUser(String id) {
    return state.orders.where((order) => order.customerId == id).toList();
  }

  Order createOrder(OrderDto dto) {
    final order = Order(id: _generateId(), title: dto.title, customerId: dto.customerId, price: dto.price, status: OrderStatus.created);
    emit(state.copyWith(orders: List.of(state.orders)..add(order)));
    return order;
  }

  String _generateId() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  @override
  OrdersState? fromJson(Map<String, dynamic> json) =>
      OrdersState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(OrdersState state) => state.toJson();
}
