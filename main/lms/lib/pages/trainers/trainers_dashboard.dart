// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lms/pages/profile.dart';

class TrainerDashboard extends StatelessWidget {
  const TrainerDashboard({
    super.key,
    required this.profile,
  });
  final Map<String, dynamic> profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainer Dashboard'),
        actions: [
          IconButton.filledTonal(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Profile(
                              profile: profile,
                            )));
              },
              icon: const Icon(Icons.person_4_outlined))
        ],
      ),
    );
  }
}
