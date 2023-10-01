import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/domain/cubit/users_cubit.dart';
import 'package:uml_freelance/view/create_order/create_order_page.dart';
import 'package:uml_freelance/view/my_orders/my_orders_page.dart';
import 'package:uml_freelance/view/register/register_page.dart';
import 'package:uml_freelance/view/users/users_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UsersCubit(),
        ),
        BlocProvider(
          create: (_) => OrdersCubit(),
        ),
        BlocProvider(
          create: (_) => AuthCubit(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, brightness) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: '/register',
          routes: {
            '/register': (context) => const RegisterPage(),
            '/users': (context) => const UsersPage(),
            '/my_orders': (context) => const MyOrdersPage(),
            '/create_order': (context) => const CreateOrderPage(),
          },
        );
      },
    );
  }
}
