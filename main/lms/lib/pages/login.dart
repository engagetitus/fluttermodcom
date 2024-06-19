
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'profile.dart';


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
        title: const Text('Login'),
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
                child: Image.asset('assets/modcom.png'),

              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: 'abc@gmail.com',
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
          Text('User Password: ${passwordController.text}'),
        ],
      ),
    );
  }
}
