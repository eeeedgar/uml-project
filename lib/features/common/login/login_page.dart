import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/app/routes.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/users_cubit.dart';
import 'package:uml_freelance/domain/dto/user_dto.dart';
import 'package:uml_freelance/domain/entities/user_role.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  var _role = UserRole.customer;

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final usersCubit = context.read<UsersCubit>();
    final authCubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
            final user = usersCubit.search(UserDto(
                name: '',
                login: _loginController.text,
                password: _passwordController.text,
                role: _role));
            if (user == null) {
              showError(context);
              return;
            }
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
          label: const Text('Log in')),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Invalid data'),
    ));
  }
}
