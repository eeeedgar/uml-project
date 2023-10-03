import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/app/routes.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/domain/entities/order_status.dart';
import 'package:uml_freelance/view/widgets/appbar.dart';

class MyTakenOrdersPage extends StatefulWidget {
  const MyTakenOrdersPage({super.key});

  @override
  State<MyTakenOrdersPage> createState() => _MyTakenOrdersPageState();
}

class _MyTakenOrdersPageState extends State<MyTakenOrdersPage> {
  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();
    final authCubit = context.read<AuthCubit>();
    final myOrders = ordersCubit
        .getOrdersForPerformer(authCubit.state.user!)
        .where((element) => element.status == OrderStatus.inProcess)
        .toList();
    return BlocBuilder<OrdersCubit, OrdersState>(
      bloc: ordersCubit,
      builder: (context, state) {
        return GestureDetector(
          onPanUpdate: (details) async {
            if (details.delta.dx < 50) {
              await Navigator.of(context)
                  .pushNamed(routeMap[Routes.myOrdersOnReview]!);
              setState(() {});
            }
          },
          child: Scaffold(
            appBar: const FreelanceAppBar(
              title: Text('Orders in process'),
            ),
            body: ListView.builder(
              itemCount: myOrders.length,
              itemBuilder: (context, index) {
                final order = myOrders[index];
                return ListTile(
                    title: Text(order.title),
                    subtitle: Text(order.description),
                    trailing: Text('${order.price.toString()} \$'),
                    onTap: () async {
                      await Navigator.of(context).pushNamed(
                          routeMap[Routes.order]!,
                          arguments: order.id);
                      setState(() {});
                    });
              },
            ),
          ),
        );
      },
    );
  }
}
