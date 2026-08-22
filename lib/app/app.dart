import 'package:flutter/material.dart';
import 'package:super_app/app/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/home',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF226678),
          primary: const Color(0xFF226678),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F7F5),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF226678),
          selectionColor: Color(0x33226678),
          selectionHandleColor: Color(0xFF226678),
        ),
      ),
    );
  }
}