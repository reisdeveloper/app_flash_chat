import 'package:app_chat_flash/src/preseatation/widgets/text_field_widghet.dart';
import 'package:flutter/material.dart';

class ResgistrerScreen extends StatefulWidget {
  const ResgistrerScreen({super.key});

  @override
  State<ResgistrerScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<ResgistrerScreen> {
  @override
  Widget build(BuildContext context) {
    String? password;
    String? email;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextField(
                onTap: () {},
                onChanged: (value) {
                  email = value;
                },
                labelText: 'Email',
                hintText: 'exemploseuemail@gmail.com',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextField(
                onTap: () {},
                onChanged: (value) {
                  password = value;
                },
                labelText: 'Senha',
                hintText: 'Digite sua senha',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomTextField(
                onTap: () {},
                onChanged: (value) {
                  password = value;
                },
                labelText: 'Confirme sua senha',
                hintText: 'Confirme sua senha',
              ),
            ),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
