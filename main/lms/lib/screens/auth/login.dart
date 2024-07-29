//import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/screens/admin/admin_dashboard.dart';
import 'package:lms/screens/students/studentdashboard.dart';
import 'package:lms/screens/trainors/trainors_dashboard.dart';
//import 'package:lms/screens/profile.dart';
import '../auth/signup.dart';
import 'package:email_validator/email_validator.dart';
//import 'package:lms/refactoring/textfield.dart';
import '../../data/users.dart';


class Login extends StatefulWidget {
  
  const Login({super.key,});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscure = true;
  late final emailController = TextEditingController(text: 'davidwamiti@gmail.com');
  final passwordController = TextEditingController();
  String email = 'Default email';
  final _formKey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,

      
        children:[ 
          Column(
          children: [
            Column(
              children : [Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => const Profile()));
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
          ]),
          
          

          Form(
            key: _formKey,
            child: Column(
              children: [
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'jane@gmail.com',
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined)),
                  keyboardType: TextInputType.emailAddress,
                  enableSuggestions: false,
                  controller: emailController,
                  // validator: (value) {
                  //     var validation = EmailValidator.validate('$value');

                  //     if(!validation){
                  //       return null;
                  //     }
                  //     else{
                  //       return 'Enter valid email';
                  //     }

                  //     },
                      onChanged: (value) {
                      
                        setState(() {
                          email = value;
                        });
                      },
                 
                ),
              ),
              
              
            
            
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                
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
                  validator: (value) {
                        // validate user input
                        if (value!.isEmpty || value == '') {
                          // if field is empty
                          return 'Please enter a Password';
                        } else if (value.length < 6 ) {
                          // if password is more than 6 char
                          return 'Must be 6 char';
                        } else {
                          return null; // Rules Satisfied
                        }
                      },
                  
                  
                  
                ),
              ),
            
              
              
            
              ]
            ),
          ),
          
          
                  
               
                
                
                
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    TextButton(onPressed:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const SignUp()));
                    }, child: const Text("Don't have an account? Sign Up")),


                    OutlinedButton(
                            onPressed: () {
                              // checking form state
                              final isValid = _formKey.currentState!.validate();
                              
                              if (!isValid) {
                    
                                
                                // DO NOT PROCEEDE
                              
                                final snackBar = SnackBar(
                                    behavior: SnackBarBehavior.fixed,
                                    content: const Text("Please Check In Form"),
                                    backgroundColor: const Color.fromARGB(255, 78, 7, 33),
                                    showCloseIcon: false,
                                    duration: const Duration(milliseconds: 1500),
                                    action: SnackBarAction(
                                      label: "Create",
                                      onPressed: () {},
                                    ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } 
                              
                              
                              
                              
                              
                              else {
                                signinwithemailandpassword(email: emailController.text.trim().toLowerCase(), password: passwordController.text).then((v){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(v.toString())));
                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Studentdashboard()));
                                });
                    
                    
                    
                                
                              }
                            },
                            child: const Text("Login")),
                  ],
                ),
                  
                  
            // Text('User Password: ${passwordController.text}'),
          ],
                  ),
      ]),
    );
  }
}

Future signinwithemailandpassword({required String email, required String password}) async {
  try{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);}
  on FirebaseAuthException catch(e){
    e.code;
  }
}