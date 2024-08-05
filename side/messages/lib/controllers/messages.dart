// Create Message
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messages/models/messages.dart';
import 'package:uuid/uuid.dart';

// Writing Message
Future newMessage(Message text) async {
  String id = Uuid().v4();
  await FirebaseFirestore.instance
      .collection('messages')
      .doc(id)
      .set(text.copyWith(id: id).toMap());
}

Future hideMessage(String id, bool visible) async {
  await FirebaseFirestore.instance
      .collection('messages')
      .doc(id)
      .update({'view': visible});
}

Future readMessage(String id, bool read) async {
  await FirebaseFirestore.instance
      .collection('messages')
      .doc(id)
      .update({'read': read});
}

Future deleteMessage(String id) async {
  await FirebaseFirestore.instance.collection('messages').doc(id).delete();
}

// Reading data
Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
  return FirebaseFirestore.instance
      .collection('messages')
      .orderBy('createdAt', descending: true) // ordering items
      .snapshots();
}
