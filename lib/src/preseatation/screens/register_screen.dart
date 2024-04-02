import 'package:app_chat_flash/src/preseatation/widgets/text_field_widghet.dart';
import 'package:flutter/material.dart';

class ResgistrerScreen extends StatefulWidget {
  const ResgistrerScreen({super.key});

  @override
  State<ResgistrerScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<ResgistrerScreen> {
  String? _password;
  String? _email;

  @override
  Widget build(BuildContext context) {
    double widht = MediaQuery.of(context).size.width;
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
                  onTap: () {},
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
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomTextField(
                  onTap: () {},
                  onChanged: (value) {
                    _password = value;
                  },
                  labelText: 'Confirme sua senha',
                  hintText: 'Confirme sua senha',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 30,
                  width: widht,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.person,
                      ),
                      Icon(
                        Icons.person,
                      ),
                      Icon(
                        Icons.person,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
