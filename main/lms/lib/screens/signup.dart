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

      body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
      
          children:[
            const Column(
              children:[
            Text('Welcome', style: TextStyle(fontSize: 30.0),),
            Text('Sign Up', style: TextStyle(fontSize: 23.0),),
          ]),



          const TextField(
              decoration: InputDecoration(
                labelText: 'FirstName',
                hintText : 'Mary',
                prefixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              
            ),


            const TextField(
              decoration: InputDecoration(
                labelText: 'LastName',
                hintText : 'Kamau',
                prefixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),



            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText : 'example@gmail.com',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress
            ),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Phone',
                hintText : '254721465789',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),

              keyboardType: TextInputType.phone
            ),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Course',
                hintText : 'Bachelor of Science in Computer Science',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Lab',
                hintText : 'Lab 9',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Profile Image',
                hintText : 'url',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Github',
                hintText : 'url',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Address',
                hintText : 'P.O. BOX 45763 Muranga',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
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
          

            );
          
      
    
  }


      
      
    



}
