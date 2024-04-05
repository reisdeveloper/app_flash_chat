import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String id;
  String author;
  String message;
  Timestamp timestamp;
  MessageModel({
    required this.id,
    required this.author,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'message': message,
      'timestamp': timestamp.toDate(),
    };
  }

  factory MessageModel.fromDocument(DocumentSnapshot documentSnapshot) {
    String id = documentSnapshot.get('id');
    String author = documentSnapshot.get('author');
    String message = documentSnapshot.get('message');
    Timestamp timestamp = documentSnapshot.get('timestamp');

    return MessageModel(
      id: id,
      author: author,
      message: message,
      timestamp: timestamp,
    );
  }
}
