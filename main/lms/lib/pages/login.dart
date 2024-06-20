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
  // Key for Form Validation - maintains widget state
  var _formkey = GlobalKey<FormState>();
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
          Form(child: Column(

          )),
          TextFormField(
            showCursor: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            validator: (value){
              // validate user input
              if (value!.isEmpty){
                return'Please Enter Email';
              }
              else if (!value.contains('@')){
                return'Enter Valid Email';
              }
            

            },
            onChanged: (value) {
              print(_email);
              setState(() {
                _email = value;
              });
            },
            decoration: const InputDecoration(
                labelText: 'Email',
                hintText: "abc@domain.com",
                suffix: Icon(Icons.email_outlined)),
          ),

          // We Definitely Need to validate User Input

          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscure,
            controller: _passwordController,
            validator: (value){
              if (value!.isEmpty || value.contains(_email)){
                return'Please Enter Password';
              }
              else if (value.length<6){
                return'Must Be 6 Char';
              }

            },
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
        
          OutlinedButton(onPressed: () {
            final isvalid = _formkey.currentState!.validate();

          }, child: Text("Login")),
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