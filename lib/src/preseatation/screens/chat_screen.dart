import 'package:app_chat_flash/src/config/router/router.dart';
import 'package:app_chat_flash/src/global/common/toast.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 33,
            ),
            onPressed: () {
              showToast(
                msg: 'Logout feito! )=;',
                background: Colors.red,
              );
              Navigator.pushNamed(context, NamedRoutes.initial);
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'ChatScreen⚡',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Scaffold(),
    );
  }
}
