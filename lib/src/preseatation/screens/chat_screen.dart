import 'package:app_chat_flash/src/config/router/router.dart';
import 'package:app_chat_flash/src/global/common/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  // armazenar a mensagem que o usuário pretende enviar
  final TextEditingController msgController = TextEditingController();

  void getCurrent() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = true as User?;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
              size: 25,
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
      body: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                msgController.text = value;
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                fillColor: Colors.blueAccent,
                hintText: 'Type your message here...',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              showToast(
                msg: 'Obrigado pelo envio da mensagem',
                background: Colors.blueAccent,
              );
              _firestore.collection('messages').add({
                'text': msgController.text,
                'send': loggedInUser?.email,
              });
            },
            child: const Text(
              'Enviar',
              style: TextStyle(
                color: Colors.blueAccent,
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
