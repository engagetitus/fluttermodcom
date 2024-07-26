//  SAVING DATA IN GOOGLE FIRESTORE
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../models/users.dart';

// CREATING

Future createUserInFirestore(Profile user) async {
  // need ro import firestore
  // we may need a package to generate unique ids
  // 1/)  the firestore way
  String uid = FirebaseAuth.instance.currentUser!.uid;
  // 2) using uuid package
  String userId = Uuid().v1();

  await FirebaseFirestore.instance
      .collection('profiles')
      .doc(uid)
      .set(user.copyWith(uid: uid).toMap());
}

// Update
Future updateUserInFirestore() async {
  await FirebaseFirestore.instance
      .collection('profiles')
      .doc('docref')
      .update({'fname': 'value'});
}
// delete 
Future deleteUserInFirestore() async{
  await FirebaseFirestore.instance.collection('profiles').doc('docref').delete();
}
