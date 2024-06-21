import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/components/dropdown.dart';
import 'package:lms/refactoring/textfield.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedCourse = courses[0];
  String selectedLab = labs[0];
  var passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        controller: ScrollController(keepScrollOffset: true),
        reverse: true,
        children: [
          Column(children: [
            const Column(children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 19.0, fontStyle: FontStyle.italic),
              ),
            ]),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'FirstName',
                  hintText: 'Mary',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'LastName',
                  hintText: 'Kamau',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Form(
             
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
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
            ),


            customTextField(labelText: 'Phone', 
            hintText: '254783299210', 
            prefixIcon: const Icon(Icons.phone), 
            border: const OutlineInputBorder(), 
            keyboardType: TextInputType.emailAddress,),
            




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

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Profile Image',
                  hintText: 'url',
                  prefixIcon: Icon(Icons.link),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Github',
                  hintText: 'url',
                  prefixIcon: Icon(Icons.link),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
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
              onPressed: () {},
              label: const Text('Sign up'),
              icon: const Icon(Icons.near_me),
            ),

            //Remember to change it later like the elevated button
            OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined button')),









            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Elevated button'),
              style: const ButtonStyle(
                  backgroundColor: WidgetStateColor.transparent,
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))))),
            ),
          ]),
        ],
      ),
    );
  }
}
