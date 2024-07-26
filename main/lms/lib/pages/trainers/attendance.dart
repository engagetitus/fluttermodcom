import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
              if (snapshot.hasData == true) {
                // we have data
                return Text(snapshot.data.docs.toString());
              } else {
                // we don't have data
                return const Text('No Records Found');
              }
            } else {
              return const Text('Something wrong happened');
            }
          }),
    );
  }
}

// FETCHING DATA FROM FIREBASE:
Stream<QuerySnapshot<Map<String, dynamic>>> getProfiles() {
  return FirebaseFirestore.instance.collection('profiles').snapshots();
}
