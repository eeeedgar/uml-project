import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/app/routes.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/view/widgets/appbar.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();
    final authCubit = context.read<AuthCubit>();
    final myOrders =
        ordersCubit.getOrdersForUser(authCubit.state.user?.id ?? '');
    return GestureDetector(
      onPanUpdate: (details) async {
        if (details.delta.dx < 50) {
          await Navigator.of(context).pushNamed(routeMap[Routes.solutions]!);
          setState(() {});
        }
      },
      child: Scaffold(
        appBar: const FreelanceAppBar(
          title: Text('My orders'),
        ),
        body: BlocBuilder<OrdersCubit, OrdersState>(
          bloc: ordersCubit,
          builder: (context, state) {
            return ListView.builder(
              itemCount: myOrders.length,
              itemBuilder: (context, index) {
                final order = myOrders[index];
                return ListTile(
                    title: Text(order.title),
                    subtitle: Text(order.status.name),
                    trailing: Text('${order.price.toString()} \$'),
                    onTap: () async {
                      await Navigator.of(context).pushNamed(
                          routeMap[Routes.myOrder]!,
                          arguments: order.id);
                      setState(() {});
                    });
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.of(context)
                  .pushNamed(routeMap[Routes.createOrder]!);
              setState(() {});
            },
            label: const Text('Create order')),
      ),
    );
  }
}
