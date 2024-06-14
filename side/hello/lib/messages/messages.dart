import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          //to show some sort of a message
          // We would Want to say ""
          // SNACKBAR  - widget showing the lightweight message that briefly informs the user when certain actions occur.
          final snackbar = SnackBar(
            behavior: SnackBarBehavior.fixed,
            duration: Duration(seconds: 5),
            content: const Text("New Message"),
            backgroundColor: const Color.fromARGB(255, 17, 69, 158),
            showCloseIcon: false,
            action: SnackBarAction(label: "Create", onPressed: () {}),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
        child: const Icon(Icons.message_outlined),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
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
                          scale: 7.5,
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
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/ruto.jfif"),
                          ),
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
