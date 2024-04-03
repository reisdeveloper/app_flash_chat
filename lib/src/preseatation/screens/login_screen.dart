import 'package:app_chat_flash/src/auth/user_auth/firebase_auth_implemetation/firebase_auth_service.dart';
import 'package:app_chat_flash/src/config/router/router.dart';
import 'package:app_chat_flash/src/preseatation/widgets/text_field_widghet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isSignin = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextField(
                onTap: () {},
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'youremailexample@gmail.com',
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextField(
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                hintText: 'Digite sua senha',
                labelText: 'Password',
                obscureCharacter: '*',
                isObscureText: true,
                maxLenght: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  _singIn();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(width, height * 0.065),
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _singIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    Future<User?> user = _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      print('Usuario logado com sucesso!');
      Navigator.pushNamed(context, NamedRoutes.chat_screen);
    }
  }
}
