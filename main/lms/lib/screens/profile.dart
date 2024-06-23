import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  const Profile({super.key,
  required this.firstName,
  required this.lastName,
  required this.email,
  required this.phone,
  required this.course,
  required this.lab,
  //required this.image,
  required this.github,
  required this.address,
  
 
  
  });

  final String firstName;
  final String lastName;
  final String course;
  final String lab;
  // final String? image;                          
  final String github;
  final String address;
  final String email;
  final String phone;
  

  
  

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
                child: Text(firstName),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(lastName),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(email),
              ),
            ],
          ),


           Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(github),
              ),
            ],
          ),

           Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(course),
              ),
            ],
          ),

          

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(lab),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(address),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(phone),
              ),
            ],
          ),

        ],

      ),


    );
  }
}