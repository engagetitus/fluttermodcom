import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      appBar: AppBar(
        title: const Text('Profile'),
      ),
      
      
      
      body: const Column(

        
        children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage('https://modcom.co.ke/img/modcom.png', scale: 30.0),
                  
                ),
              ],
            ),


          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Name', textAlign: TextAlign.start,),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Phone'),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('email'),
              ),
            ],
          )

        ],

      ),


    );
  }
}