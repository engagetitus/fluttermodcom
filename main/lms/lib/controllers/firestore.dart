//  SAVING DATA IN GOOGLE FIRESTORE
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../models/courses.dart';
import '../models/fees.dart';
import '../models/users.dart';

// CREATING

Future createUserInFirestore(Profile user) async {
  // need ro import firestore
  // we may need a package to generate unique ids
  // 1/)  the firestore way
  String uid = FirebaseAuth.instance.currentUser!.uid;
  // 2) using uuid package

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
Future deleteUserInFirestore() async {
  await FirebaseFirestore.instance
      .collection('profiles')
      .doc('docref')
      .delete();
}

// COURSEES
Future saveCourseToFirestore(Courses course) async {
  String docId = const Uuid().v1();
  return await FirebaseFirestore.instance
      .collection('courses')
      .doc(docId)
      .set(course.copyWith(id: docId).toMap());
}

// FETCHING DATA FROM FIREBASE:
Stream<QuerySnapshot<Map<String, dynamic>>> getCourses() {
  return FirebaseFirestore.instance
      .collection('courses')
      .orderBy('createdAt', descending: true) // ordering items
      .snapshots();
}

// Fees
Stream<QuerySnapshot<Map<String, dynamic>>> getFees() {
  return FirebaseFirestore.instance
      .collection('feestatements')
      .orderBy('createdOn', descending: true) // ordering items
      .snapshots();
}

Future saveFeesToFirestore(Fees course) async {
  String docId = const Uuid().v1();
  return await FirebaseFirestore.instance
      .collection('feestatements')
      .doc(docId)
      .set(course.copyWith(id: docId).toMap());
}
