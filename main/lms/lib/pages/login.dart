import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/dropdown.dart';
import 'profile.dart';
import 'signup.dart';

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
  String selectedgender = gender[0];
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
          ElevatedButton(onPressed: () {}, child: Text("Elevated")),
          OutlinedButton(onPressed: () {}, child: Text("Outlined")),
          DropdownButton(
              isExpanded: true,
              value: selectedgender,
              items: gender.map((String item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
              onChanged: (String? item) {
                setState(() {
                  // saving the selection
                  selectedgender = item!;
                });
              }),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SignUp()));
                },
                child: const Text(
                  "SIGNUP",
                  style: TextStyle(color: Colors.green),
                )),
          )
        ],
      ),
    );
  }
}
