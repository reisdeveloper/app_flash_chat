import 'dart:io';

import 'package:app_chat_flash/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp()
      : Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyCCg6GT_ZQfTxmT54Zf8LaMGARupBdb5u4',
            appId: '1:862720623189:android:a683b778c0e43bd8ed0adc',
            messagingSenderId: '862720623189',
            projectId: 'flash-chat-app-7d2ea',
          ),
        );
  runApp(const App());
}
