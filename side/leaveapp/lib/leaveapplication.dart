import 'package:flutter/material.dart';

class LeaveApplication extends StatefulWidget {
  const LeaveApplication({super.key});

  @override
  State<LeaveApplication> createState() => _LeaveApplicationState();
}

class _LeaveApplicationState extends State<LeaveApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make Application"),
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(hintText: "Input User Id"),
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Leave Type"),
          ),
          const TextField(
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(hintText: "Remarks"),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {},
                    child: const Text("Apply")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
