import 'package:flutter/material.dart';

class ResgistrerScreen extends StatefulWidget {
  const ResgistrerScreen({super.key});

  @override
  State<ResgistrerScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<ResgistrerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resgistrer Screen'),
      ),
    );
  }
}
