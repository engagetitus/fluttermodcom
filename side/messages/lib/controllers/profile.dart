// checking if user exists

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messages/models/profile.dart';

String? firebaseUId = FirebaseAuth.instance.currentUser?.uid;

Future<DocumentSnapshot> getUserDocument() async {
  return await FirebaseFirestore.instance
      .collection('messageUsers')
      .doc('AeOVdBIjuq3ad1HSBbJi') // the null check handles exception
      .get();
}

Future newProfile(Profile text) async {
  await FirebaseFirestore.instance
      .collection('messageUsers')
      .doc(firebaseUId)
      .set(text.copyWith(id: firebaseUId).toMap());
}
