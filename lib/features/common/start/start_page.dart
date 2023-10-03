import 'package:flutter/material.dart';
import 'package:uml_freelance/app/routes.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freelance'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(routeMap[Routes.login]!);
              },
              child: const Text('Log in'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(routeMap[Routes.register]!);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
