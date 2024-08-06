// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/models/courses.dart';
import 'package:lms/models/fees.dart';

import '../../components/textfield.dart';
import '../../controllers/firestore.dart';

class CreatePayment extends StatelessWidget {
  final bool isCredit;
  const CreatePayment({
    Key? key,
    required this.isCredit,
  }) : super(key: key);
//  final String userId;
//   final double amount;
//   final String reference;
//   final bool isCredt;
  @override
  Widget build(BuildContext context) {
    TextEditingController amount = TextEditingController();
    TextEditingController reference = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //   final String code;
            customTextField('Amount',
                hint: '10000',
                controller: amount,
                keyboardType: TextInputType.number,
                icon: Icons.money),
            spacing,
            //   final String name;
            customTextField('Bank/Mpesa Reference',
                hint: 'Your Reference',
                controller: reference,
                keyboardType: TextInputType.name,
                icon: Icons.book),
            //   final String description;
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // create object
            Fees fee = Fees(
                id: 'id',
                userId: FirebaseAuth.instance.currentUser?.uid ?? '',
                amount: double.tryParse(amount.text) ?? 0,
                reference: reference.text,
                isCredt: isCredit,
                createdOn: DateTime.now(),
                isApproved: false);
            // Save to Firebase
            saveFeesToFirestore(fee).then((v) {
              Navigator.pop(context);
            });

            // Close page
          },
          label: const Text('Save')),
    );
  }
}
