
//Saving data in Google Firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lms/models/users.dart';
import 'package:uuid/uuid.dart';

Future createUserInFirestore(Profile user) async{
//Import FireStore


//Firestore way 
String uid = FirebaseAuth.instance.currentUser!.uid;

//Package to geneate unique ids
String userId = const Uuid().v1();
await FirebaseFirestore.instance.collection('profiles').doc(userId).set(user.copyWith(uid : uid).toMap());



}

//Update 
Future updateUserInFireStore() async{
  await FirebaseFirestore.instance.collection('profiles').doc().update({"key":"value"});
}

//Delete
Future  deleteUserInFireStore() async{
  await FirebaseFirestore.instance.collection('profiles').doc().delete();
}
