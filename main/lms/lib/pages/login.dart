import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'profile.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Handling the input
  //1. Use Variable
  String _email = "Default Email";
  //2,. Using A Controller
  final _passwordController = TextEditingController();

  // CHALLENGE DYNAMIC OBSCURE TEXT
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Profile()));
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/logo/modcom.png',
                scale: 3.0,
              ),
            ),
          ),
          const Text("Login"),
          TextField(
            showCursor: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            onChanged: (value) {
              print(_email);
              setState(() {
                _email = value;
              });
            },
            decoration: const InputDecoration(
                labelText: 'Email',
                hintText: "jane@domain.com",
                suffix: Icon(Icons.email_outlined)),
          ),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscure,
            controller: _passwordController,
            decoration: InputDecoration(
                hintText: 'Secret word',
                labelText: 'Password',
                suffix: IconButton(
                    onPressed: () {
                      // handle click
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: Icon(
                        obscure ? Icons.visibility : Icons.visibility_off))),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  //TASK : GO TO SIGNUP
                },
                child: Text(
                  "SIGNUP",
                  style: TextStyle(color: Colors.green),
                )),
          )
        ],
      ),
    );
  }
}
