import 'package:flutter/material.dart';

class Statements extends StatefulWidget {
  const Statements({super.key});

  @override
  State<Statements> createState() => _StatementsState();
}

class _StatementsState extends State<Statements> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children:

        List.generate(10, (index){
          return Column(
              children: [
                Text('Statement $index'),
                Text(index.toString()),
                const Divider()
              ],
          );
        })
      ,
    );
  }
}
