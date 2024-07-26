// Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';

Future signUpWithEmailPass(
    {required String email, required String password}) async {
  // create the user
  //1. add firebase_auth dependency
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    return e.code;
  }
}

Future signInWithEmailPassword(
    {required String email, required String password}) async {
  // try {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  return 'successful';
  // } on FirebaseAuthException catch (e) {
  //   return e.code;
  // }
}