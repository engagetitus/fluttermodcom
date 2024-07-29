import 'package:flutter/material.dart';
import 'package:lms/screens/auth/login.dart';
import 'package:lms/screens/auth/signup.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GestureDetector(
        onTap: (){
          // //Navigate to stacking pages
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const SignUp()));
          // //pushReplacement removes the page from the stack 
          // //same as finish() in Kotlin

        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.1,
          child: const Center(child:  Text('Get Started', textAlign: TextAlign.center,))),
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/modcom.png', color: Theme.of(context).brightness == Brightness.dark? Colors.white : null),
          const Text('Learning Management System'), 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Login()));
            }, style: const ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.amber)), child: const Text('Log In'),),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const SignUp()));
              }, style: const ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.lime)),child: const Text('Sign up'),),
          
      ],
          ),
          
        ],
      ),
    );
  }
}