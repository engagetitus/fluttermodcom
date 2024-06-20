import 'package:flutter/material.dart';

import 'package:lms/pages/components/dropdown.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedCourse = courses[0]; // setting initial
  final _labController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        reverse: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(children: [
              const Column(children: [
                Text(
                  'Hey There',
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
                    hintText: 'Lewis',
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
                    hintText: 'Mbogori',
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
                      hintText: 'abc@gmail.com',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '0792322047',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone),
              ),
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
              DropdownButton(
                  isExpanded: true,
                  hint: const Text("select Course"),
                  enableFeedback: true,
                  value: selectedCourse,
                  items: courses.map((String item) {
                    return DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        enabled: selectedCourse != item,
                        value: item,
                        child: Text(item));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCourse = newValue!;
                    });
                  }),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButtonFormField(
                  items: labs.map((String item) {
                    return DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        enabled: _labController.text != item,
                        value: item,
                        child: Text(item));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _labController.text = newValue!;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Lab',
                    hintText: 'Lab 9',
                    prefixIcon: Icon(Icons.cell_tower_outlined),
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
                    hintText: 'P.O Box Address',
                    prefixIcon: Icon(Icons.home_filled),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
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

              OutlinedButton.icon(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                  ),
                  icon: const Icon(Icons.near_me),
                  onPressed: () {},
                  label: const Text("Outline Button"))
            ]),
          ),
        ],
      ),
    );
  }
}