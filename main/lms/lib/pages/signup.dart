import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Here'),
      ),

      body: const Column(
        children: [
             TextField(
              decoration: InputDecoration(
                  hintText: 'Lewis',
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                  ),

            ), 
            
               TextField(
              decoration: InputDecoration(
                  hintText: 'Mbogori',
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                  ),

            ),
            
               TextField(
              decoration: InputDecoration(
                  hintText: 'abc@gmail.com',
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  ),

            ),
            
               TextField(
              decoration: InputDecoration(
                  hintText: '0792322047',
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  ),

            ),
            
               TextField(
              decoration: InputDecoration(
                  hintText: 'Flutter',
                  labelText: 'Course',
                  border: OutlineInputBorder(),
                  ),

            ),
            
               TextField(
              decoration: InputDecoration(
                  hintText: 'Lab 9',
                  labelText: 'Lab',
                  border: OutlineInputBorder(),
                  ),

            ),
            
               TextField(
              decoration: InputDecoration(
                  labelText: 'Profile Image',
                  border: OutlineInputBorder(),
                  ),

            ),
            
               TextField(
              decoration: InputDecoration(
                  labelText: 'Github',
                  border: OutlineInputBorder(),
                  ),

            ),
            
               TextField(
              decoration: InputDecoration(
                  labelText: 'Physical Address',
                  border: OutlineInputBorder(),
                  ),

            ),// text field

        ],
        
        
      ),

      

    );
  }
}