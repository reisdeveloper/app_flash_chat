import 'package:app_chat_flash/src/config/router/router.dart';
import 'package:app_chat_flash/src/preseatation/widgets/text_field_widghet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResgistrerScreen extends StatefulWidget {
  const ResgistrerScreen({super.key});

  @override
  State<ResgistrerScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<ResgistrerScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    late String _email;
    late String _password;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Registre-se',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomTextField(
                  onTap: () {
                    _auth.createUserWithEmailAndPassword(
                      email: _email,
                      password: _password,
                    );
                  },
                  onChanged: (value) {
                    _email = value;
                  },
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
                  onChanged: (value) {
                    _password = value;
                  },
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
                  onPressed: () async {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      );
                      if (newUser != null) {
                        Navigator.of(context)
                            .pushNamed(NamedRoutes.chat_screen);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height * 0.065),
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Register'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
