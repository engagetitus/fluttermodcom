//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/screens/profile.dart';
import 'package:lms/screens/signup.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Profile()));
                },
                child: const Image(
                  image: NetworkImage('https://modcom.co.ke/img/modcom.png',
                      scale: 30.0),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 25.2),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: 'jane@gmail.com',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined)),
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              controller: emailController,
            ),
          ),
          
          
          
          Padding(
            padding:  const EdgeInsets.all(15.0),
           
            child: TextField(
              decoration:  InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    obscure = !obscure;
                  });
                },icon : Icon(obscure? Icons.visibility_off : Icons.visibility)),
                labelText: 'Password',
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: obscure,
              obscuringCharacter: '*',
              controller: passwordController,
            ),
          ),

             TextButton(
                style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                      ),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignUp()));
          
                },
                child: const Text('Log In'),
          ),


          // Text('User Password: ${passwordController.text}'),
        ],
      ),
    );
  }
}
