import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/app/routes.dart';
import 'package:uml_freelance/domain/cubit/users_cubit.dart';
import 'package:uml_freelance/view/widgets/appbar.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    final usersCubit = context.read<UsersCubit>();
    return GestureDetector(
      onPanUpdate: (details) async {
        if (details.delta.dx < 50) {
          await Navigator.of(context).pushNamed(routeMap[Routes.complaints]!);
          setState(() {});
        }
      },
      child: Scaffold(
        appBar: const FreelanceAppBar(
          title: Text('Registered users'),
        ),
        body: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text('${user.login} ${user.name}'),
                  subtitle: Text(user.role.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => usersCubit.deleteUser(user.id),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
