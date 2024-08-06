// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:lms/pages/auth/portals.dart';

import '../../controllers/firebaseauth.dart';
import '../../data/users.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Handling the input
  //1. Use Variable
  //2,. Using A Controller
  final _passwordController = TextEditingController();
  late final _emailController = TextEditingController();

  // CHALLENGE DYNAMIC OBSCURE TEXT
  bool obscure = true;
  String selectedgender = gender[0];
  // KEy For Form Validation - maintains widget state
  final _formKey = GlobalKey<FormState>();
  //controllers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/logo/modcom.png',
                scale: 3.0,
              ),
            ),
          ),
          Text(
            "User Login",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Wrap Form Fields
                    TextFormField(
                      controller: _emailController,
                      showCursor: false,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        }

                        if (EmailValidator.validate(value) == false) {
                          return 'Enter Valid Email';
                        } else {
                          return null; // Rules Satisfied
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: "jane@domain.com",
                          suffix: Icon(Icons.email_outlined)),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscure,
                      controller: _passwordController,
                      validator: (value) {
                        // validate user input
                        if (value!.isEmpty || value == '') {
                          // if field is empty
                          return 'Please enter an Password';
                        } else {
                          return null; // Rules Satisfied
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
                              icon: Icon(obscure
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                        style: ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(Size(
                                MediaQuery.of(context).size.width * .75, 50))),
                        onPressed: () {
                          // checking form state
                          final isValid = _formKey.currentState!.validate();

                          if (!isValid) {
                            // DO NOT PROCEEDE

                            final snackBar = SnackBar(
                                behavior: SnackBarBehavior.fixed,
                                content: const Text("Please Check In Form"),
                                backgroundColor:
                                    const Color.fromARGB(255, 78, 7, 33),
                                showCloseIcon: false,
                                action: SnackBarAction(
                                  label: "Create",
                                  onPressed: () {},
                                ));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            signInWithEmailPassword(
                                    email: _emailController.text
                                        .trim()
                                        .toLowerCase(),
                                    password: _passwordController.text)
                                .then((v) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) => Portals()));
                              // if successful
                            }).catchError((e) {
                              // print out
                              var snackBar = SnackBar(
                                behavior: SnackBarBehavior.fixed,
                                content: Text(e.code),
                                backgroundColor:
                                    Color.fromARGB(255, 158, 17, 34),
                                showCloseIcon: false,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                            // NAVIGATing Based On role
                          }
                        },
                        child: const Text("Login")),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
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
