import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uml_freelance/domain/dto/order_dto.dart';
import 'package:uml_freelance/domain/entities/order.dart';
import 'package:uml_freelance/domain/entities/order_status.dart';
import 'package:uml_freelance/domain/entities/user.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';
part 'orders_cubit.g.dart';

class OrdersCubit extends HydratedCubit<OrdersState> {
  OrdersCubit() : super(const OrdersState());

  List<Order> getOrdersForUser(String id) {
    return state.orders.where((order) => order.customerId == id).toList();
  }

  List<Order> getOrdersForPerformer(User user) {
    return state.orders
        .where((order) => order.currentPerformerId == user.id)
        .toList();
  }

  Order createOrder(OrderDto dto) {
    final order = Order(
      id: _generateId(),
      title: dto.title,
      description: dto.description,
      customerId: dto.customerId,
      price: dto.price,
      status: OrderStatus.created,
    );
    emit(state.copyWith(orders: List.of(state.orders)..add(order)));
    return order;
  }

  String _generateId() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  List<Order> getCreatedOrders() {
    return state.orders
        .where((order) => order.status == OrderStatus.created)
        .toList();
  }

  void closeOrder(String orderId) {
    final order = state.orders.firstWhere((element) => element.id == orderId);
    final newOrder = _copyOrderWithStatus(order, status: OrderStatus.closed);
    _updateOrder(newOrder);
  }

  void reopenOrder(String orderId) {
    final order = state.orders.firstWhere((element) => element.id == orderId);
    final newOrder = _copyOrderWithStatus(order, status: OrderStatus.created);
    _updateOrder(newOrder);
  }

  void takeOrder(String orderId, User user) {
    final order = state.orders.firstWhere((element) => element.id == orderId);
    final newOrder = _copyOrderWithStatus(
      order,
      status: OrderStatus.inProcess,
      currentPerformerId: user.id,
    );
    _updateOrder(newOrder);
  }

  void leaveOrder(String orderId) {
    final order = state.orders.firstWhere((element) => element.id == orderId);
    final newOrder = _copyOrderWithStatus(
      order,
      status: OrderStatus.created,
      currentPerformerId: 'x',
    );
    _updateOrder(newOrder);
  }

  void sendToReview(String orderId) {
    final order = state.orders.firstWhere((element) => element.id == orderId);
    final newOrder = _copyOrderWithStatus(
      order,
      status: OrderStatus.readyToReview,
    );
    _updateOrder(newOrder);
  }

  void done(String orderId) {
    final order = state.orders.firstWhere((element) => element.id == orderId);
    final newOrder = _copyOrderWithStatus(
      order,
      status: OrderStatus.done,
    );
    _updateOrder(newOrder);
  }

  void complain(String orderId) {
    final order = state.orders.firstWhere((element) => element.id == orderId);
    final newOrder = _copyOrderWithStatus(
      order,
      status: OrderStatus.hasComplaint,
    );
    _updateOrder(newOrder);
  }

  void acceptComplaint(String orderId) {
    final order = state.orders.firstWhere((element) => element.id == orderId);
    final newOrder = _copyOrderWithStatus(
      order,
      currentPerformerId: 'x',
      status: OrderStatus.created,
    );
    _updateOrder(newOrder);
  }

  @override
  OrdersState? fromJson(Map<String, dynamic> json) =>
      OrdersState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(OrdersState state) => state.toJson();

  Order _copyOrderWithStatus(Order old,
      {OrderStatus? status, String? currentPerformerId}) {
    return Order(
      id: old.id,
      title: old.title,
      description: old.description,
      price: old.price,
      customerId: old.customerId,
      currentPerformerId: currentPerformerId == 'x'
          ? null
          : currentPerformerId ?? old.currentPerformerId,
      status: status ?? old.status,
    );
  }

  void _updateOrder(Order order) {
    emit(
      state.copyWith(
        orders: List.of(state.orders)
          ..removeWhere((element) => element.id == order.id)
          ..add(order),
      ),
    );
  }
}
