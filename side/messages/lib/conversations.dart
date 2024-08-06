import 'package:flutter/material.dart';
import 'package:messages/controllers/messages.dart';
import 'package:messages/models/messages.dart';

class Conversations extends StatefulWidget {
  const Conversations({super.key});

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  TextEditingController newMessages = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String name = "David";
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(name),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.call_outlined), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.video_call_outlined), onPressed: () {}),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        children: [
          // Stream Builder
          Expanded(child: messagesFeed()),
          // Text Field To Send Messagesd
          Text(newMessages.text),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Expanded(
                    child: TextField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      hintText: 'Text Message', border: InputBorder.none),
                )),
                IconButton.filled(
                    onPressed: () async {
                      // Send Message
                      Message message = Message(
                          id: 'id',
                          senderId: 'senderId',
                          senderName: 'senderName',
                          receiptId: 'receiptId',
                          isRead: false,
                          view: false,
                          createdAt: DateTime.now(),
                          text: 'newMessages.text');
                      await newMessage(message).then((v) {
                        // cleares controller
                        newMessages.dispose();
                      });
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget messagesFeed() {
    return StreamBuilder(
        stream: getMessages(),
        builder: (context, AsyncSnapshot snapshot) {
          // This is not different from future buider
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            // We know we are already getting some data.
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              // we dont have data
              return const Text('No Messages Found');
            } else {
              var documents = snapshot
                  .data!.docs; // The Snapshots everything in the collecytion

              // we  have data
              return ListView.builder(
                  reverse: true, // have latest messages a
                  itemCount: documents.length,
                  itemBuilder: (context, i) {
                    var data = documents[i].data()
                        as Map<String, dynamic>; // get data from documents
                    Message newMsg =
                        Message.fromMap(data); // converting back to model
                    return GestureDetector(
                      onLongPress: () {
                        deleteMessage(newMsg.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: newMsg.isRead ? null : Colors.blue),
                          child: Text(
                            newMsg.text,
                            textAlign: newMsg.senderId == 'myId'
                                ? TextAlign.right
                                : TextAlign.left,
                          ),
                        ),
                      ),
                    );
                  });
            }
          } else {
            return const Text('Something wrong happened');
          }
        });
  }
}
