import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/app/routes.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/view/widgets/appbar.dart';

class AvailableOrdersPage extends StatefulWidget {
  const AvailableOrdersPage({super.key});

  @override
  State<AvailableOrdersPage> createState() => _AvailableOrdersPageState();
}

class _AvailableOrdersPageState extends State<AvailableOrdersPage> {
  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();
    final createdOrders = ordersCubit.getCreatedOrders();
    return GestureDetector(
      onPanUpdate: (details) async {
        if (details.delta.dx < 50) {
          await Navigator.of(context)
              .pushNamed(routeMap[Routes.myTakenOrders]!);
          setState(() {});
        }
      },
      child: Scaffold(
        appBar: const FreelanceAppBar(title: Text('Available orders')),
        body: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: createdOrders.length,
              itemBuilder: (context, index) {
                final order = createdOrders[index];
                return ListTile(
                  onTap: () async {
                    await Navigator.of(context).pushNamed(
                        routeMap[Routes.order]!,
                        arguments: order.id);
                    setState(() {});
                  },
                  title: Text(order.title),
                  subtitle: Text(order.description),
                  trailing: Text('${order.price} \$'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
