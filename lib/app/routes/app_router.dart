import 'package:flutter/material.dart';
import 'package:super_app/features/home/presentation/pages/home_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}