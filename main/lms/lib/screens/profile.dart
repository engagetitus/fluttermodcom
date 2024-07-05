import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  const Profile({super.key,
  
  required this.profile,
 
  
  });
final Map <String, dynamic> profile; 
  @override
  Widget build(BuildContext context) {
   
    return   Scaffold(

      appBar: AppBar(
        title: const Text('Profile'),
      ),
      
      
      
      body:  Column(

        
        children: [

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage('https://modcom.co.ke/img/modcom.png', scale: 30.0),
                  
                ),
              ],
            ),


           const Row(
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
                padding: const EdgeInsets.all(8.0),
                child: Text(profile['firstName']),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(profile['lastName']),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(profile['email']),
              ),
            ],
          ),


           Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(profile['github']),
              ),
            ],
          ),

           Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(profile['course']),
              ),
            ],
          ),

          

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(profile['lab']),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(profile['address']),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(profile['phone']),
              ),
            ],
          ),

        ],

      ),


    );
  }
}