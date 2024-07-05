import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:lms/components/dropdown.dart';
import '../../data/courses.dart';

import '../../components/textfield.dart';
import '../../data/users.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedCourse = courses[0]; // setting initial
  final _labController = TextEditingController(text: labs[0]);
  final _fNameController = TextEditingController(text: 'John');
  final _lNameController = TextEditingController(text: 'Doe');
  final _emailController = TextEditingController(text: 'engage@titus.co.ke');
  final _phoneController = TextEditingController(text: '0102718995');
  final _profileController =
      TextEditingController(text: 'https://modcom.co.ke/grad_images/pic7.JPG');
  final _gitController = TextEditingController(
      text: "https://github.com/engagetitus/fluttermodcom");
  final _addressController = TextEditingController(text: 'Nairobi');
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
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        icon: const Icon(Icons.near_me),
                        onPressed: () {
                          final _isValid = _formKey.currentState?.validate();
                          if (!_isValid!) {
                            return;
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Login(profile: {
                                          'name': _fNameController.text,
                                          'email': _emailController.text,
                                          'phone': _phoneController.text,
                                          'profile': _profileController.text,
                                          'github': _gitController.text,
                                          'address': _addressController.text,
                                          'classes': _labController.text,
                                          'course': selectedCourse,
                                          'role': role
                                        })));
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

// TextButton.icon(
//   icon: const Icon(Icons.near_me),
//   style: ButtonStyle(
//     foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
//   ),
//   onPressed: () {},
//   label: const Text('Text Button'),
// ),
// ElevatedButton.icon(
//     style: const ButtonStyle(
//         shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
//         backgroundColor:
//             const MaterialStatePropertyAll(Colors.amber)),
//     icon: const Icon(Icons.near_me),
//     onPressed: () {},
//     label: const Text("Elevated Button")),
