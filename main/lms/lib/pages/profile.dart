import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      appBar: AppBar(
        title: const Text('Profile'),
      ),
      
      
      
      body:  Column(

        
        children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset('modcom.png'),

              ],
            ),


          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('Name', textAlign: TextAlign.start,),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('Phone'),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('email'),
              ),
            ],
          )

        ],

      ),


    );
  }
}