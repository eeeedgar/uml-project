import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/domain/entities/order.dart';
import 'package:uml_freelance/domain/entities/order_status.dart';
import 'package:uml_freelance/view/widgets/appbar.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)!.settings.arguments as String;

    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final order = state.orders.firstWhere(
          (element) => element.id == orderId,
        );
        return Scaffold(
          appBar: const FreelanceAppBar(title: Text('Order')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Title'),
                    Text(order.title),
                  ],
                ),
                Column(
                  children: [
                    const Text('Description'),
                    Text(order.description),
                  ],
                ),
                Column(
                  children: [
                    const Text('Price'),
                    Text('${order.price} \$'),
                  ],
                ),
                Column(
                  children: [
                    const Text('Status'),
                    Text(order.status.name),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: ChangeOrderStatusButton(
            order: order,
          ),
        );
      },
    );
  }
}

class ChangeOrderStatusButton extends StatelessWidget {
  const ChangeOrderStatusButton({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();
    switch (order.status) {
      case (OrderStatus.created):
        {
          return FloatingActionButton.extended(
              onPressed: () {
                ordersCubit.closeOrder(order.id);
              },
              label: const Text('Close'));
        }
      case (OrderStatus.closed):
        {
          return FloatingActionButton.extended(
              onPressed: () {
                ordersCubit.reopenOrder(order.id);
              },
              label: const Text('Reopen'));
        }
      default:
        {
          return Container();
        }
    }
  }
}
