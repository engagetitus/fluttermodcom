// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controllers/firestore.dart';
import '../models/courses.dart';
import '../models/fees.dart';

class FetchStatements extends StatelessWidget {
  final bool isAdmin;
  const FetchStatements({
    Key? key,
    required this.isAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getFees(),
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
              var documents = snapshot
                  .data!.docs; // The Snapshots everything in the collecytion

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                      columns: const [
                        DataColumn(label: Text('#')),
                        DataColumn(label: Text('Type')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Status'))
                      ],
                      rows: List<DataRow>.generate(documents.length, (index) {
                        var data =
                            documents[index].data() as Map<String, dynamic>;
                        // convert to model for consistency
                        Fees fee = Fees.fromMap(data);
                        return DataRow(cells: [
                          DataCell(Text((index + 1).toString())),
                          DataCell(Text(fee.isCredt ? 'Credit' : 'Debit')),
                          DataCell(Text(fee.amount.toStringAsFixed(1))),
                          DataCell(Text(fee.createdOn.toIso8601String())),
                          DataCell(onTap: () {
                            FirebaseFirestore.instance
                                .collection('feestatements')
                                .doc(fee.id)
                                .update({'isApproved': !fee.isApproved});
                          }, Text(fee.isApproved ? 'Approved' : 'Pending'))
                        ]);
                      })),
                ),
              );

              // we  have data
            }
          } else {
            return const Text('Something wrong happened');
          }
        });
  }
}
