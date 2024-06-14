import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //SnackBar implementation(Toast in Android Kotlin)
          final snackBar = SnackBar(
            content: const Text('New Message'), 
            backgroundColor: Colors.lightBlueAccent,
            showCloseIcon: false,
            action: SnackBarAction(label: 'Undo', onPressed:(){}),
            duration: const Duration(milliseconds: 2500),
            behavior: SnackBarBehavior.fixed,
            );


          
          
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Image.asset(
          'assets/startmessages.webp',
          scale: 1.0,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/messages.png',
                        scale: 10.0,
                      ),
                      const Text(
                        'Messages',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13.0),
                        child: Icon(Icons.search),
                      ),
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://static.independent.co.uk/s3fs-public/thumbnails/image/2014/10/03/12/Labrinth_close_up.jpg?quality=75&width=1250&crop=3%3A2%2Csmart&auto=webp'))
                    ],
                  ),
                )
              ],
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
