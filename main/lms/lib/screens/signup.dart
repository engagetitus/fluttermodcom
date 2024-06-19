import 'package:flutter/material.dart';




class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('')

      ),

      body:ListView(
        scrollDirection: Axis.vertical,
        reverse: true,
        children: [
          Column(
              
          
              children:[
                const Column(
                  children:[
                Text('Welcome', style: TextStyle(fontSize: 30.0),),
                Text('Sign Up', style: TextStyle(fontSize: 23.0),),
              ]),
          
          
          
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: 'FirstName',
                      hintText : 'Mary',
                      prefixIcon : Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    
                  ),
              ),
          
          
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'LastName',
                      hintText : 'Kamau',
                      prefixIcon : Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
          
          
          
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText : 'example@gmail.com',
                      prefixIcon : Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress
                  ),
                ),
          
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      hintText : '254721465789',
                      prefixIcon : Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  
                    keyboardType: TextInputType.phone
                  ),
                ),
          
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Course',
                      hintText : 'Bachelor of Science in Computer Science',
                      prefixIcon : Icon(Icons.book),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
          
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Lab',
                      hintText : 'Lab 9',
                      prefixIcon : Icon(Icons.cell_tower),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
          
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Profile Image',
                      hintText : 'url',
                      prefixIcon : Icon(Icons.link),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
          
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Github',
                      hintText : 'url',
                      prefixIcon : Icon(Icons.link),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
          
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Address',
                      hintText : 'P.O. BOX 45763 Muranga',
                      prefixIcon : Icon(Icons.home_filled),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
          
                TextButton(
                style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                      ),
                onPressed: () {
          
          
                },
                child: const Text('Sign up'),
          )
          
          
              ]
          
              ),
        ],
      ),
          

            );
          
      
    
  }


      
      
    



}
