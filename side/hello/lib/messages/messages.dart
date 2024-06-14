import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.message_outlined),),
        body: Column(children: [
          Container(
            color: Colors.blue,
            height: 300.0,
            //icon
            //messages
            //search icon,circe avatar
            ),

            Container(
              height: 700,
              

            )
          
        ],),





    );
  }
}