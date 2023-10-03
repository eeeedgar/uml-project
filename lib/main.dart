import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uml_freelance/app/routes.dart';
import 'package:uml_freelance/domain/cubit/auth_cubit.dart';
import 'package:uml_freelance/domain/cubit/complaints_cubit.dart';
import 'package:uml_freelance/domain/cubit/orders_cubit.dart';
import 'package:uml_freelance/domain/cubit/solutions_cubit.dart';
import 'package:uml_freelance/domain/cubit/users_cubit.dart';
import 'package:uml_freelance/features/admin/complaints/complaints_page.dart';
import 'package:uml_freelance/features/customer/create_order/create_order_page.dart';
import 'package:uml_freelance/features/common/login/login_page.dart';
import 'package:uml_freelance/features/customer/orders/my_orders_page.dart';
import 'package:uml_freelance/features/customer/solutions/all_solutions_page.dart';
import 'package:uml_freelance/features/performer/orders/my_taken_orders.dart';
import 'package:uml_freelance/features/performer/orders/created_orders_page.dart';
import 'package:uml_freelance/features/customer/orders/my_order_page.dart';
import 'package:uml_freelance/features/performer/orders/order_page.dart';
import 'package:uml_freelance/features/common/register/register_page.dart';
import 'package:uml_freelance/features/common/start/start_page.dart';
import 'package:uml_freelance/features/admin/users/users_page.dart';
import 'package:uml_freelance/features/performer/orders/orders_on_review_page.dart';

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
        BlocProvider(
          create: (_) => SolutionsCubit(),
        ),
        BlocProvider(
          create: (_) => ComplaintsCubit(),
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
          initialRoute: routeMap[Routes.start]!,
          routes: {
            routeMap[Routes.start]!: (context) => const StartPage(),
            routeMap[Routes.register]!: (context) => const RegisterPage(),
            routeMap[Routes.login]!: (context) => const LoginPage(),
            routeMap[Routes.users]!: (context) => const UsersPage(),
            routeMap[Routes.myOrders]!: (context) => const MyOrdersPage(),
            routeMap[Routes.createOrder]!: (context) => const CreateOrderPage(),
            routeMap[Routes.availableOrders]!: (context) =>
                const AvailableOrdersPage(),
            routeMap[Routes.myOrder]!: (context) => const MyOrderPage(),
            routeMap[Routes.order]!: (context) => const OrderPage(),
            routeMap[Routes.myTakenOrders]!: (context) =>
                const MyTakenOrdersPage(),
            routeMap[Routes.myOrdersOnReview]!: (context) =>
                const OrdersOnReviewPage(),
            routeMap[Routes.solutions]!: (context) => const AllSolutionsPage(),
            routeMap[Routes.complaints]!: (context) => const ComplaintsPage(),
          },
        );
      },
    );
  }
}
