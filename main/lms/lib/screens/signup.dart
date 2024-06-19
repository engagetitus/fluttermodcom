import 'package:flutter/material.dart';
import 'package:lms/components/dropdown.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedCourse = courses[0]; 
  String selectedLab = labs[0];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
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
                style: TextStyle(fontSize: 23.0),
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

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@gmail.com',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress),
            ),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    hintText: '254721465789',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone),
            ),

            DropdownButton(
                value: selectedCourse,
                items: courses.map((String item) {
                  return DropdownMenuItem(
                  enabled: selectedCourse != item,value: item, 
                  alignment: Alignment.centerLeft,
                  child: Text(item));
                }).toList(),


                onChanged: (String? newValue) {
                  setState(() {
                    selectedCourse =  newValue!;

                  });
                  
                  
                }),





              DropdownButton(
              value: selectedLab,
                items: labs.map((String item1) {
                  return DropdownMenuItem(
                  enabled: selectedLab != item1, 
                  value: item1, 
                  child: Text(item1));
                }).toList(),


                onChanged: (String? newValue1) {
                  setState(() {
                    selectedLab =  newValue1!;

                  });
                  
                  
                }),

               
                
                
                



            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Course',
                  hintText: 'Bachelor of Science in Computer Science',
                  prefixIcon: Icon(Icons.book),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Lab',
                  hintText: 'Lab 9',
                  prefixIcon: Icon(Icons.cell_tower),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

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
                onPressed: () {}, child: const Text('Outlined button')),

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
