import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/complaints_cubit.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/domain/cubit/solutions_cubit.dart';
import 'package:uml_freelance/domain/entities/order.dart';
import 'package:uml_freelance/domain/entities/solution.dart';
import 'package:uml_freelance/view/widgets/appbar.dart';

class AllSolutionsPage extends StatefulWidget {
  const AllSolutionsPage({super.key});

  @override
  State<AllSolutionsPage> createState() => _AllSolutionsPageState();
}

class _AllSolutionsPageState extends State<AllSolutionsPage> {
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
    final solutionsCubit = context.read<SolutionsCubit>();
    final ordersCubit = context.read<OrdersCubit>();
    final authCubit = context.read<AuthCubit>();
    final orders = ordersCubit.getOrdersForUser(authCubit.state.user!.id);

    final solutions = solutionsCubit.state.solutions
        .where((s) => orders.any((o) => o.id == s.orderId))
        .where((element) => !element.viewed)
        .toList();
    return Scaffold(
      appBar: const FreelanceAppBar(title: Text('Solutions')),
      body: BlocBuilder<SolutionsCubit, SolutionsState>(
        bloc: solutionsCubit,
        builder: (context, state) {
          return ListView.builder(
            itemCount: solutions.length,
            itemBuilder: (context, index) {
              final sol = solutions[index];
              final ord = orders
                  .where(
                    (element) => element.id == sol.orderId,
                  )
                  .first;
              return Slidable(
                key: UniqueKey(),
                // The start action pane is the one at the left or the top side.
                startActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates.
                  motion: const ScrollMotion(),

                  // A pane can dismiss the Slidable.
                  dismissible: DismissiblePane(onDismissed: () {}),

                  // All actions are defined in the children parameter.
                  children: [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      onPressed: (context) {
                        decline(context, sol, ord);
                        setState(() {});
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.thumb_down,
                      label: 'Decline',
                    ),
                  ],
                ),

                // The end action pane is the one at the right or the bottom side.
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        acceptSolution(context, sol, ord);
                        setState(() {});
                      },
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.thumb_up,
                      label: 'Accept',
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(sol.title),
                  subtitle: Text(ord.title),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void acceptSolution(BuildContext context, Solution solution, Order order) {
    final sCubit = context.read<SolutionsCubit>();
    final oCubit = context.read<OrdersCubit>();

    sCubit.viewSolution(solution.id);
    oCubit.done(order.id);
  }

  void decline(BuildContext context, Solution solution, Order order) {
    final sCubit = context.read<SolutionsCubit>();
    final oCubit = context.read<OrdersCubit>();

    sCubit.viewSolution(solution.id);
    oCubit.complain(order.id);

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
                  controller: _answerController,
                  decoration: const InputDecoration(labelText: 'Answer'),
                ),
                MaterialButton(
                  onPressed: () {
                    context.read<ComplaintsCubit>().postComplaint(
                        _answerController.text, solution.id, order.id);
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: const Text('Send'),
                )
              ],
            )),
      ),
    );
  }
}
