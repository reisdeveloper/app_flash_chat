import 'package:flutter/material.dart';

Widget defaultBtn(
  String text,
  Function Function() btnPressed,
) {
  return Row(
    children: [
      ElevatedButton(
        onPressed: btnPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          minimumSize: const Size(80, 15),
        ),
        child: Text(text),
      ),
    ],
  );
}
