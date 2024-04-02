import 'package:app_chat_flash/src/preseatation/widgets/text_field_widghet.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200,
                child: Image.asset('assets/images/instantaneo-large.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextField(
                hintText: 'youremailexample@gmail.com',
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextField(
                hintText: 'Digite sua senha',
                labelText: 'Password',
                isObscureChacaracter: '*',
                isObscureText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
