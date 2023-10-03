import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/domain/dto/order_dto.dart';
import 'package:uml_freelance/view/widgets/appbar.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();
    final authCubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: const FreelanceAppBar(
        title: Text('Create order'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ordersCubit.createOrder(
            OrderDto(
              title: _titleController.text,
              description: _descriptionController.text,
              customerId: authCubit.state.user!.id,
              price: int.parse(_priceController.text),
            ),
          );
          Navigator.of(context).pop();
        },
        label: const Text('Create task'),
      ),
    );
  }
}
