import 'package:app_chat_flash/src/preseatation/screens/chat_screen.dart';
import 'package:app_chat_flash/src/preseatation/screens/login_screen.dart';
import 'package:app_chat_flash/src/preseatation/screens/register_screen.dart';
import 'package:app_chat_flash/src/preseatation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    NamedRoutes.initial: (_) => const WelcomeScreen(),
    NamedRoutes.register_screen: (_) => const ResgistrerScreen(),
    NamedRoutes.login_screen: (_) => const LoginScreen(),
    NamedRoutes.chat_screen: (_) => const ChatScreen(),
  };
}

class NamedRoutes {
  static const String initial = '/';
  static const String welcome_screen = '/welcome';
  static const String login_screen = '/login';
  static const String register_screen = '/register';
  static const String chat_screen = '/chat';
}
