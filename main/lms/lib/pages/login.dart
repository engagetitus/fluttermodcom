
import 'package:flutter/material.dart';

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
  // KEy For Form Validation - maintains widget state
  final _formKey = GlobalKey<FormState>();

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
                'assets/modcom.png',
                scale: 3.0,
              ),
            ),
          ),
          const Text("Login"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Wrap Form Fields
                    TextFormField(
                      showCursor: false,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        final emailPattern =
                            RegExp(r"^[\w\.-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$");
                        // validate user input
                        if (value!.isEmpty || !emailPattern.hasMatch(value)) {
                          // if field is empty
                          // if email is Valid
                          return 'Enter Valid Email';
                        } else {
                          return null; // Rules Satisfied
                        }
                      },
                      onChanged: (value) {
                      
                        setState(() {
                          _email = value;
                        });
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
                        } else if (value.length < 6 ||
                            !value.contains(_email)) {
                          // if password is more than 6 char
                          return 'Must be 6 char';
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
                    OutlinedButton(
                        onPressed: () {
                          // checking form state
                          final isValid = _formKey.currentState!.validate();

                          if (isValid) {
                            // DO NOT PROCEEDE

                            final snackBar = SnackBar(
                                behavior: SnackBarBehavior.fixed,
                                content: const Text("Please Check In Form"),
                                backgroundColor: Color.fromARGB(255, 78, 7, 33),
                                showCloseIcon: false,
                                action: SnackBarAction(
                                  label: "Create",
                                  onPressed: () {},
                                ));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final snackBar = SnackBar(
                                behavior: SnackBarBehavior.fixed,
                                content: const Text("Sign In"),
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  17,
                                  69,
                                  158,
                                ),
                                showCloseIcon: false,
                                action: SnackBarAction(
                                  label: "Create",
                                  onPressed: () {},
                                ));

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Text("Login")),
                  ],
                )),
          ),
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
