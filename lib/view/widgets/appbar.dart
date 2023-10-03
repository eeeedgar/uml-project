import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uml_freelance/app/routes.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';

class FreelanceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FreelanceAppBar({
    super.key,
    required this.title,
  });

  final Widget title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: title,
      leading: Navigator.canPop(context)
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_new))
          : null,
      actions: [
        MaterialButton(
          child: const Text('Log out'),
          onPressed: () {
            context.read<AuthCubit>().logout();
            Navigator.of(context).pushNamedAndRemoveUntil(
                routeMap[Routes.start]!, (route) => false);
          },
        ),
      ],
    );
  }
}
