import 'package:flutter/material.dart';
import 'package:super_app/app/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/home',
    );
  }
}