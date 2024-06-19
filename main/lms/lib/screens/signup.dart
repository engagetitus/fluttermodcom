import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text(''),

        ),



      body: const Column(
        children: [Column(
          children: [
            Text('Welcome', textAlign: TextAlign.center, style: TextStyle(fontSize: 50.9),
            
            ),
        
            Text('Login to your account ', textAlign: TextAlign.center, style: TextStyle(fontSize: 15.2),
            
            )
          ],
        ),
        
            Column(children: [Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(readOnly: false, showCursor: true, autocorrect: false, keyboardType: TextInputType.emailAddress, decoration: InputDecoration(hintText: 'Enter your email address'),),
            ), 
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.0),
              child: TextField(readOnly: false, showCursor: true, autocorrect: false, keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true), decoration: InputDecoration(hintText: 'Enter your password'),),
            )]),
        
        ],
      ),
    );
  }
}