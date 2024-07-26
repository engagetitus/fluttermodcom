import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore

import 'package:lms/components/dropdown.dart';
import 'package:lms/controllers/firestore.dart';
import 'package:lms/models/users.dart';
import 'package:uuid/uuid.dart';
import '../../controllers/firebaseauth.dart';
import '../../data/courses.dart';

import '../../components/textfield.dart';
import '../../data/users.dart';
import '../students/student_dashboard.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedCourse = courses[0]; // setting initial
  final _labController = TextEditingController(text: labs[0]);
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _phoneController = TextEditingController();
  final _profileController = TextEditingController();
  final _gitController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: SafeArea(
          child: Column(children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 30.0),
            ),
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 23.0),
            ),
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customTextField('FirstName',
                        hint: 'Mary',
                        controller: _fNameController,
                        keyboardType: TextInputType.name,
                        icon: Icons.person, validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return "Enter Name";
                      } else {
                        return null;
                      }
                    }),
                    spacing,
                    customTextField('LastName',
                        hint: 'Kamau',
                        controller: _lNameController,
                        keyboardType: TextInputType.name,
                        icon: Icons.person, validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return "Enter Name";
                      } else {
                        return null;
                      }
                    }),
                    spacing,
                    customTextField('Email',
                        hint: 'example@gmail.com',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.email, validator: (value) {
                      if (value!.isEmpty || !EmailValidator.validate(value)) {
                        return "Enter Valid Email";
                      } else {
                        return null;
                      }
                    }),
                    spacing,
                    customTextField('Password',
                        hint: 'secret word',
                        controller: _passController,
                        keyboardType: TextInputType.visiblePassword,
                        icon: Icons.password, validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Valid Password";
                      } else {
                        return null;
                      }
                    }),
                    spacing,
                    TextFormField(
                        controller: _phoneController,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                          hintText: '254721465789',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty ||
                              value == '' ||
                              value.length < 10) {
                            return "Enter Phone Number";
                          } else {
                            return null;
                          }
                        }),
                    spacing,
                    // Select Role - Radio Buttons
                    Column(
                      children: List<Widget>.generate(roles.length, (index) {
                        return RadioListTile(
                          title: Text(roles[index]),
                          value: roles[index],
                          groupValue: role,
                          onChanged: (String? value) {
                            setState(() {
                              role = value;
                            });
                          },
                        );
                      }),
                      //  [
                      //
                      // ],
                    ),

                    customDrop(
                      'Course',
                      selectedCourse,
                      courses.toList(),
                      (newValue) {
                        setState(() {
                          selectedCourse = newValue!;
                        });
                      },
                    ),
                    spacing,
                    customDrop(
                      'Lab',
                      labs[0],
                      labs.toList(),
                      (newValue) {
                        setState(() {
                          _labController.text = newValue!;
                        });
                      },
                    ),
                    spacing,
                    TextFormField(
                        controller: _profileController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: 'Profile Image',
                          hintText: 'url',
                          prefixIcon: Icon(Icons.link),
                          border: OutlineInputBorder(),
                        ),
                        validator:
                            validateUrl // since i am to reuse it on the next field; I have defined the string?
                        ),
                    spacing,
                    TextFormField(
                        controller: _gitController,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          labelText: 'Github',
                          hintText: 'url',
                          prefixIcon: Icon(Icons.code),
                          border: OutlineInputBorder(),
                        ),
                        validator: validateUrl),
                    spacing,
                    TextFormField(
                        minLines: 2,
                        maxLines: 10,
                        controller: _addressController,
                        textInputAction: TextInputAction.newline,
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          hintText: 'P.O. BOX 45763 Muranga',
                          prefixIcon: Icon(Icons.home_filled),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return "Enter Address";
                          } else {
                            return null;
                          }
                        }),
                    OutlinedButton.icon(
                        style: const ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                        ),
                        icon: const Icon(Icons.near_me),
                        onPressed: () {
                          final _isValid = _formKey.currentState?.validate();
                          if (!_isValid!) {
                            return;
                          } else {
                            Profile newuser = Profile(
                                uid: 'uid',
                                fName: _fNameController.text,
                                lName: _lNameController.text,
                                email: _emailController.text,
                                phone: _phoneController.text,
                                address: _addressController.text,
                                role: role ?? '',
                                github: _gitController.text,
                                classId: _labController.text,
                                courses: selectedCourse,
                                imageUrl:
                                    'https://modcom.co.ke/grad_images/pic7.JPG',
                                createdAt: DateTime.now());
                            newuser.toMap();
                            // aCTUALLY lOG THEM iN:
                            signUpWithEmailPass(
                                    email: _emailController.text
                                        .toLowerCase() // convert to lowercase

                                        .trim(), // removes leadeing spaces
                                    password: _passController.text)
                                .then((v) {
                              // authentication listener
                              FirebaseAuth.instance
                                  .authStateChanges()
                                  .listen((user) async {
                                if (user != null) {
                                  // Create User In Database
                                  await createUserInFirestore(newuser);
                                }
                              });

                              // then create User

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => StudentDashboard()));
                            }).catchError((e) {});
                          }
                        },
                        label: const Text("SignUp"))
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
