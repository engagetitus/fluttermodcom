import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(text: 'Students'),
              Tab(text: 'Results'),
              Tab(text: 'Accounts')
            ]),
          ),
          body: const TabBarView(children: [
            Text('Welcome Students'),
            Text('Welcome Results'),
            Text('Welcome Accounts'),
          ])),
    );
  }
}
