import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/domain/entities/order_status.dart';
import 'package:uml_freelance/view/widgets/appbar.dart';

class OrdersOnReviewPage extends StatelessWidget {
  const OrdersOnReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();
    final authCubit = context.read<AuthCubit>();
    final myOrders = ordersCubit
        .getOrdersForPerformer(authCubit.state.user!)
        .where((element) => element.status == OrderStatus.readyToReview)
        .toList();
    return BlocBuilder<OrdersCubit, OrdersState>(
      bloc: ordersCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: const FreelanceAppBar(
            title: Text('Orders on review'),
          ),
          body: ListView.builder(
            itemCount: myOrders.length,
            itemBuilder: (context, index) {
              final order = myOrders[index];
              return ListTile(
                  title: Text(order.title),
                  subtitle: Text(order.description),
                  trailing: Text('${order.price.toString()} \$'),
                  );
            },
          ),
        );
      },
    );

  }
}