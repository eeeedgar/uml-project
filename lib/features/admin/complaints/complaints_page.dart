import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/complaints_cubit.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/domain/cubit/solutions_cubit.dart';
import 'package:uml_freelance/domain/entities/complaint.dart';
import 'package:uml_freelance/domain/entities/complaint_status.dart';
import 'package:uml_freelance/domain/entities/order.dart';
import 'package:uml_freelance/domain/entities/solution.dart';
import 'package:uml_freelance/view/widgets/appbar.dart';

class ComplaintsPage extends StatefulWidget {
  const ComplaintsPage({super.key});

  @override
  State<ComplaintsPage> createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
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
    final complaintsCubit = context.read<ComplaintsCubit>();
    final ordersCubit = context.read<OrdersCubit>();
    final complaints = complaintsCubit.state.complaints
        .where((e) => e.status == ComplaintStatus.created)
        .toList();

    return Scaffold(
      appBar: const FreelanceAppBar(title: Text('Complaints')),
      body: BlocBuilder<ComplaintsCubit, ComplaintsState>(
        bloc: complaintsCubit,
        builder: (context, state) {
          return ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              final com = complaints[index];
              final ord = ordersCubit.state.orders
                  .where(
                    (element) => element.id == com.orderId,
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
                        decline(context, com, ord);
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
                        acceptComplaint(context, com, ord);
                      },
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.thumb_up,
                      label: 'Accept',
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(com.description),
                  subtitle: Text(ord.title),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void acceptComplaint(BuildContext context, Complaint c, Order order) {
    final cCubit = context.read<ComplaintsCubit>();
    final oCubit = context.read<OrdersCubit>();

    cCubit.setStatus(c.id, ComplaintStatus.accepted);
    oCubit.acceptComplaint(order.id);
    setState(() {});
  }

  void decline(BuildContext context, Complaint c, Order order) {
    final cCubit = context.read<ComplaintsCubit>();
    final oCubit = context.read<OrdersCubit>();

    cCubit.setStatus(c.id, ComplaintStatus.declined);
    oCubit.done(order.id);
    setState(() {});
  }
}
