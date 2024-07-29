import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/components/dropdown.dart';
import 'package:lms/components/textfield.dart';
import 'package:lms/controllers/firebaseauth.dart';
import 'package:lms/controllers/firestore.dart';
import 'package:lms/screens/auth/login.dart';
import 'package:lms/models/users.dart';
import 'package:lms/screens/students/studentdashboard.dart';
import '../../data/courses.dart';
import '../../data/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedCourse = courses[0];
  String selectedLab = labs[0];
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var firstName = TextEditingController(text: 'David');
  var lastName = TextEditingController(text: 'Kamau');
  var email = TextEditingController(text: 'davidwamiti11200@gmail.com');
  var phone = TextEditingController(text: '25476899867');
  var image = TextEditingController(text: '');
  var github = TextEditingController(text: '');
  var address = TextEditingController(text: 'Muranga');
 
  String? role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        actions: [TextButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
        }, child: const Text('Log In'))],
      ),
      
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          controller: ScrollController(keepScrollOffset: true),
          reverse: true,
          children: [
            Form(
              key: _formKey,
              child: Column(children: [
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 30.0),
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 19.0, fontStyle: FontStyle.italic),
                ),
              
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: firstName,
                    decoration: const InputDecoration(
                      labelText: 'FirstName',
                      hintText: 'Mary',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: lastName,
                    decoration: const InputDecoration(
                      labelText: 'LastName',
                      hintText: 'Kamau',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                
              
                
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'example@gmail.com',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      
                      
                      
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        } 
                        else if (!value.contains('@')) {
                          return "Please check your email's format";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress),
                ),
              
              
                customTextField(labelText: 'Phone', 
                hintText: '254783299210', 
                prefixIcon: const Icon(Icons.phone), 
                border: const OutlineInputBorder(), 
                keyboardType: TextInputType.emailAddress,
                controller: phone
                ),
                
              //Select Role
              Column(
                children: 
                List<Widget>.generate(roles.length,(index){
                  return RadioListTile(
                      title:  Text(roles[index]),
                      value: roles[index],
                      groupValue: role,
                      onChanged: (value){
                        setState((){
                          role = value;
                        });
                      },
                  );
              
                }),
                
                
              ),
              
              
              
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DropdownButtonFormField(
                      value: selectedCourse,
              
              
                      items: courses.map((String item) {
                        return DropdownMenuItem(
                            enabled: selectedCourse != item,
                            value: item,
                            alignment: Alignment.centerLeft,
                            child: Text(item));
                      }).toList(),
              
                     
              
                      decoration: const InputDecoration(
                        labelText: 'Course',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.book),
                      ),
              
              
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCourse = newValue!;
                        });
                      }),
                ),
              
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DropdownButtonFormField(
                      value: selectedLab,
                      items: labs.map((String item1) {
                        return DropdownMenuItem(
                            enabled: selectedLab != item1,
                            value: item1,
                            child: Text(item1));
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Labs',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.business_center),
                      ),
                      onChanged: (String? newValue1) {
                        setState(() {
                          selectedLab = newValue1!;
                        });
                      }),
                ),
              
                // const Padding(
                //   padding: EdgeInsets.all(15.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       labelText: 'Course',
                //       hintText: 'Bachelor of Science in Computer Science',
                //       prefixIcon: Icon(Icons.book),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
              
                // const Padding(
                //   padding: EdgeInsets.all(15.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       labelText: 'Lab',
                //       hintText: 'Lab 9',
                //       prefixIcon: Icon(Icons.cell_tower),
                //       border: OutlineInputBorder(),
                //     ),
                //   ),
                // ),
              
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: image,
                    decoration: const InputDecoration(
                      labelText: 'Profile Image',
                      hintText: 'url',
                      prefixIcon: Icon(Icons.link),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: github,
                    decoration: const InputDecoration(
                      labelText: 'Github',
                      hintText: 'url',
                      prefixIcon: Icon(Icons.link),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: address,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      hintText: 'P.O. BOX 45763 Muranga',
                      prefixIcon: Icon(Icons.home_filled),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              
                TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                                      
                    if(_formKey.currentState!.validate()){
                      

                      signupwithemailandpassword(
                        email: email.text.toLowerCase().trim(), password: passwordController.text).then((v){

                           Profile newuser = Profile(
                            uid : 'uid',
                            fname: firstName.text,
                            lname: lastName.text,
                            email: email.text,
                            phone : phone.text,
                            address : address.text,
                            role: role ?? 'role',
                            github: github.text,
                            classId : selectedLab,
                            courses : selectedCourse,
                            imageUrl: image.text,
                            createdAt: DateTime.now(),
         
                          );
                          newuser.toMap();
                          //then create user
                      //Authentication listener
                      FirebaseAuth.instance.authStateChanges().listen((user){
                        if(user != null){
                          //Create user in database
                          createUserInFirestore(newuser).catchError((e){
                            ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(actions : const [Text('Done')],content: Text(e.toString())));
                          });
                        }
                      });

                         


                         Navigator.push(context, MaterialPageRoute(builder: (_)=> const Studentdashboard(
                       )
                  
                      ));
                          
                      }).catchError((e){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                      });
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ensure all fields are filled in correctly')));
                    }
      




                     
                    
                   
        
                  }, 
                  label: const Text('Sign up'),
                  icon: const Icon(Icons.near_me),
                ),
              
                //Remember to change it later like the elevated button
                
              
              
              
              
              
              
              
              
                
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

//     Map<String,dynamic> profile = {
                      // 'firstName': firstName.text, 
                      // 'lastName': lastName.text, 
                      // 'email': email.text, 
                      // 'phone': phone.text,
                      // 'role': role, 
                      // 'course': selectedCourse, 
                      // 'lab': selectedLab,  
                      // 'github': github.text, 
                      // 'address': address.text
                      // };


