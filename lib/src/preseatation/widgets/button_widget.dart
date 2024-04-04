import 'package:flutter/material.dart';

class ButtonCustomWidget extends StatelessWidget {
  final String name;

  const ButtonCustomWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height * 0.065),
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
        child: Text(name),
      ),
    );
  }
}
