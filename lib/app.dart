import 'package:app_chat_flash/src/config/router/router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      initialRoute: NamedRoutes.initial,
      routes: Routes.routes,
    );
  }
}
