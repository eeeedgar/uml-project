import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/domain/cubit/solutions_cubit.dart';
import 'package:uml_freelance/domain/entities/order.dart';
import 'package:uml_freelance/domain/entities/order_status.dart';
import 'package:uml_freelance/view/widgets/appbar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late TextEditingController _answerController;

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _answerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderId = ModalRoute.of(context)!.settings.arguments as String;
    final authCubit = context.read<AuthCubit>();

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
                if (order.currentPerformerId == authCubit.state.user?.id)
                  const Column(
                    children: [
                      Text('Performer'),
                      Text('Me'),
                    ],
                  ),
              ],
            ),
          ),
          floatingActionButton: ChangeOrderStatusButton(
            order: order,
            answerController: _answerController,
          ),
        );
      },
    );
  }
}

class ChangeOrderStatusButton extends StatelessWidget {
  const ChangeOrderStatusButton({
    super.key,
    required this.order,
    required this.answerController,
  });

  final Order order;
  final TextEditingController answerController;

  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();
    final authCubit = context.read<AuthCubit>();
    final solutionsCubit = context.read<SolutionsCubit>();
    switch (order.status) {
      case (OrderStatus.created):
        {
          return FloatingActionButton.extended(
              heroTag: "btn1",
              onPressed: () {
                ordersCubit.takeOrder(order.id, authCubit.state.user!);
              },
              label: const Text('Take'));
        }
      case (OrderStatus.inProcess):
        {
          if (order.currentPerformerId != authCubit.state.user!.id) {
            return const Placeholder();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                  heroTag: "btn2",
                  onPressed: () {
                    ordersCubit.leaveOrder(order.id);
                  },
                  label: const Text('Leave')),
              const SizedBox(
                height: 16,
              ),
              FloatingActionButton.extended(
                  heroTag: "btn3",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextField(
                                  controller: answerController,
                                  decoration: const InputDecoration(
                                      labelText: 'Answer'),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    ordersCubit.sendToReview(order.id);
                                    solutionsCubit.postSolution(
                                        answerController.text,
                                        authCubit.state.user!,
                                        order.id);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Send'),
                                )
                              ],
                            )),
                      ),
                    );
                    // ordersCubit.sendToReview(order.id);
                  },
                  label: const Text('Send to review')),
            ],
          );
        }
      default:
        {
          return Container();
        }
    }
  }
}
