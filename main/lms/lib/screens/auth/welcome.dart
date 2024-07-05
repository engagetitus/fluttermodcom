import 'package:flutter/material.dart';
import 'package:lms/screens/auth/signup.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GestureDetector(
        onTap: (){
          //Navigate to stacking pages
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const SignUp()));
          //pushReplacement removes the page from the stack 
          //same as finish() in Kotlin

        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.1,
          width : MediaQuery.of(context).size.height*1,

          child: const Text('Get Started', textAlign: TextAlign.center,),
        ),
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/modcom.png', color: Theme.of(context).brightness == Brightness.dark? Colors.white : null),
          const Text('Learning Management System')
        ],
      ),
    );
  }
}