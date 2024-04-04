import 'package:app_chat_flash/src/config/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> singInWithEmailAndPassword(BuildContext context) async {
    final email = _email.text.trim();
    final password = _password.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushNamed(context, NamedRoutes.chat_screen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('E-mail não encontrado. Por favor, verifique o e-mail.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha incorreta. Por favor, verifique a senha.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'ERROR_INVALID_CREDENTIAL') {
        // Tratar outras exceções
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Erro ao fazer login. Por favor, tente novamente mais tarde.'),
            backgroundColor: Colors.redAccent,
          ),
        );
        print('Erro de autenticação: ${e.code}');
      }
    } catch (e) {
      // Tratar outras exceções
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Erro ao fazer login. Por favor, tente novamente mais tarde.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      print('Erro ao fazer login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextFormField(
                  key: _emailKey,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email Obrigatório';
                    }
                    return null;
                  },
                  onTap: () {},
                  controller: _email,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      gapPadding: 5,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    hintText: 'seuemail@gmail.com',
                    hintStyle: TextStyle(fontFamily: 'Poppins'),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onTap: () {},
                  controller: _password,
                  keyboardType: TextInputType.visiblePassword,
                  obscuringCharacter: '•',
                  obscureText: true,
                  maxLength: 20,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      _formKey.currentState?.reset();
                      _emailKey.currentState?.validate();
                      return 'Senha Obrigatória';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.security_outlined,
                      color: Colors.white,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    labelText: 'Senha',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 5,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _formKey.currentState?.reset();
                  _emailKey.currentState?.validate();
                },
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    singInWithEmailAndPassword(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      width,
                      height * 0.060,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
