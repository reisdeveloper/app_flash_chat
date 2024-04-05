import 'package:app_chat_flash/src/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatProvider {
  final FirebaseFirestore firebaseFirestore;

  ChatProvider({required this.firebaseFirestore});

  Stream<QuerySnapshot> getMessageList() {
    return firebaseFirestore
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  void setMessageList(String message, String id, String author) {
    MessageModel chatMessages = MessageModel(
      id: id,
      author: author,
      message: message,
      timestamp: Timestamp.now(),
    );
    firebaseFirestore.collection('messages').add(chatMessages.toJson());
  }
}
