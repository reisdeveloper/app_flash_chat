import 'package:app_chat_flash/src/auth/user_auth/firebase_auth_implemetation/firebase_auth_service.dart';
import 'package:app_chat_flash/src/config/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:app_chat_flash/src/preseatation/widgets/text_field_widghet.dart';

class ResgistrerScreen extends StatefulWidget {
  const ResgistrerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ResgistrerScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<ResgistrerScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Registre-se',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomTextField(
                  onTap: () {},
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'exemploseuemail@gmail.com',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomTextField(
                  onTap: () {},
                  controller: _passwordController,
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                  onPressed: () {
                    _signUp();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height * 0.065),
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Register'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.singUpWithEmailAndPassword(email, password);

    if (user != null) {
      print('Usuário criado com sucesso!');
      Navigator.of(context).pushNamed(NamedRoutes.chat_screen);
    } else {
      print('Erro ao criar Usuário');
    }
  }
}
