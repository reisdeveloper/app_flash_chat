import 'package:app_chat_flash/src/config/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResgistrerScreen extends StatefulWidget {
  const ResgistrerScreen({super.key});

  @override
  State<ResgistrerScreen> createState() => _ResgistrerScreenState();
}

class _ResgistrerScreenState extends State<ResgistrerScreen> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  Future<bool> signUpWithEmailAndPassword() async {
    try {
      // Criar usuer
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _email.text.trim(), password: _password.text.trim());
      // receber user
      FirebaseAuth.instance.userChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          Navigator.pushNamed(context, NamedRoutes.chat_screen);
        }
      });
      if (userCredential.user == null) {
        return false;
      } else {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Resgistrer-se',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextFormField(
                  key: emailKey,
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
                      formKey.currentState?.reset();
                      emailKey.currentState?.validate();
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
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    formKey.currentState?.validate();
                    bool results = await signUpWithEmailAndPassword();
                    if (results == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Não foi possível realizar o cadastro',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Cadastro realizado com sucesso',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    }
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
                    'Resgistrar',
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
