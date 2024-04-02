import 'package:app_chat_flash/src/config/router/router.dart';
import 'package:app_chat_flash/src/preseatation/widgets/button_widget.dart';
import 'package:app_chat_flash/src/preseatation/widgets/welcome_title_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const WelcomeTitleWidget(),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Material(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(30),
              elevation: 5,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(NamedRoutes.login_screen);
                },
                minWidth: 300,
                height: 42,
                child: const Text('Log In'),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Material(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(30),
              elevation: 5,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(NamedRoutes.register_screen);
                },
                minWidth: 300,
                height: 42,
                child: const Text('Register'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
