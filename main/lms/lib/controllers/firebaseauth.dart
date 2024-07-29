

// Firebase authentication
import 'package:firebase_auth/firebase_auth.dart';

Future signupwithemailandpassword({required String email, required String password}) async{
  // create user
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

}