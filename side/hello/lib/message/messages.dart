
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.fixed,
          content: const Text("New Message"),
          backgroundColor: const Color.fromARGB(255, 17, 69, 158,),
          showCloseIcon: false,
          action: SnackBarAction(label:"Create", onPressed: (){},)
        );
          
          
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
          
        },
        child: Image.asset('assets/newmsg.jpg'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/message.png', scale: 7.5,),
                        
                        Text(
                          'Messages',
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.0),
                          child: Icon(Icons.search),
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/ruto.jpeg"),
                        )
                      ],
                    ),
                  )
                ],
              ),
              // google icon
              // messages
              // search icon, circle avatar
            ),
          ),
          const Expanded(
              flex: 4,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        textAlign: TextAlign.center,
                        "Once you've started a new conversation, you'll see it listed here"),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
