import 'package:flutter/material.dart';

import '../../components/statements.dart';
import '../admin/add_payment.dart';

class Statements extends StatefulWidget {
  const Statements({super.key});

  @override
  State<Statements> createState() => _StatementsState();
}

class _StatementsState extends State<Statements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CreatePayment(
                          isCredit: false,
                        )));
          },
          label: const Icon(Icons.payment)),
      body: const FetchStatements(
        isAdmin: false,
      ),
    );
  }
}
