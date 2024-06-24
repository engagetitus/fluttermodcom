import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Container(height: 100, child: Image.asset('assets/logo/modcom.png')),
          const Text("Modcom Institute"),
          const Text("Modcom Institute"),
          const Text("Modcom Institute")
        ],
      ),
    );
  }
}
