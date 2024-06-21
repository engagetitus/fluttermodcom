import 'package:flutter/material.dart';
// import 'package:lms/screens/profile.dart';
import 'package:lms/screens/signup.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Handling the input
  //1. Use variables

  //Chsllange
  bool obscure = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/modcom.jpg', // Path to your school logo
                  scale: 3.0,
                  height: 220.0,
                  width: 220.0,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  textCapitalization: TextCapitalization.none,
                  showCursor: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || !EmailValidator.validate(value)) {
                      return 'Please enter valid email';
                    }
                    //  else if (!value.contains('@')) {
                    //   return 'Enter Valid Email';}
                    else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  cursorOpacityAnimates: true,
                  obscureText: obscure,
                  showCursor: false,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: Icon(obscure
                          ? Icons.visibility
                          : Icons.visibility_off_rounded),
                    ),
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Passwor';
                    } else if (value.length < 6) {
                      return 'Must be more than 6 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      //TASK : GO TO SIGNUP
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
                      );
                    },
                    child: const Text(
                      "Don't have an Account?, SIGNUP",
                      style: TextStyle(color: Color.fromARGB(255, 76, 91, 175)),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigate to ProfileScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
