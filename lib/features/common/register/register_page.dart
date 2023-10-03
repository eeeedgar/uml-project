import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/app/routes.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/users_cubit.dart';
import 'package:uml_freelance/domain/dto/user_dto.dart';
import 'package:uml_freelance/domain/entities/user_role.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _nameController;
  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  var _role = UserRole.customer;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _loginController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final usersCubit = context.read<UsersCubit>();
    final authCubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(labelText: 'Login'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            DropdownButton(
                value: _role,
                items: const [
                  DropdownMenuItem(
                    value: UserRole.customer,
                    child: Text('Customer'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.performer,
                    child: Text('Performer'),
                  ),
                  DropdownMenuItem(
                    value: UserRole.admin,
                    child: Text('Administrator'),
                  ),
                ],
                onChanged: (role) {
                  _role = role ?? _role;
                  setState(() {});
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_nameController.text.isEmpty ||
                _loginController.text.isEmpty ||
                _passwordController.text.isEmpty) {
              showError(context, 'Fill data');
              return;
            }

            final userDto = UserDto(
                name: _nameController.text,
                login: _loginController.text,
                password: _passwordController.text,
                role: _role);

            if (!usersCubit.isUnique(userDto)) {
              showError(context, 'This login is taken');
              return;
            }

            final user = usersCubit.registerUser(userDto);
            authCubit.login(user);
            switch (user.role) {
              case (UserRole.customer):
                Navigator.of(context).pushNamedAndRemoveUntil(
                    routeMap[Routes.myOrders]!, (r) => false);
              case (UserRole.performer):
                Navigator.of(context).pushNamedAndRemoveUntil(
                    routeMap[Routes.availableOrders]!, (r) => false);
              case (UserRole.admin):
                Navigator.of(context).pushNamedAndRemoveUntil(
                    routeMap[Routes.users]!, (r) => false);
            }
          },
          label: const Text('Register')),
    );
  }

  void showError(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }
}
