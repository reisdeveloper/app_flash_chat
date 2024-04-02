import 'package:flutter/material.dart';

class WelcomeTitleWidget extends StatelessWidget {
  const WelcomeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'logo',
          child: Image.asset('assets/images/instantaneo-medium.png'),
        ),
        const Text(
          'FlashChat App',
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
