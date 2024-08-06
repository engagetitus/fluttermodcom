import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lms/models/users.dart';

class Attandance extends StatefulWidget {
  const Attandance({super.key});

  @override
  State<Attandance> createState() => _AttandanceState();
}

class _AttandanceState extends State<Attandance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: getProfiles(),
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
                return const Text('No Records Found');
              } else {
                var documents = snapshot.data!.docs; // The Snapshots everything in the collecytion
                return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      var data =
                          documents[index].data() as Map<String, dynamic>;
                      // convert to model for consistency
                      Profile user = Profile.fromMap(data);
                      return UserCard(user: user);
                    });
                // we  have data
              }
            } else {
              return const Text('Something wrong happened');
            }
          }),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final Profile user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(user.lName.substring(0, 1)),
      ),
      title: Text(user.fName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(user.courses)],
      ),
    );
  }
}

// FETCHING DATA FROM FIREBASE:
Stream<QuerySnapshot<Map<String, dynamic>>> getProfiles() {
  return FirebaseFirestore.instance.collection('profiles').snapshots();
}
