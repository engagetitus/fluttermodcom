import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//import 'package:hello/profile/stateless.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Standard'),
            IconButton(onPressed: () {}, icon: const Icon(Icons.apps))
          ],
        ),
        actions: const [Icon(Icons.refresh)],
        leading: const Icon(Icons.add_photo_alternate_rounded),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          Expanded(
            flex: 2,
          child :Container(
            height: 170,
            color: Colors.white,
          ),
          ),
          
          
          const Expanded(
            flex:4,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                Text("Clear", style: TextStyle(fontSize: 25.2)),
                Text("+", style: TextStyle(fontSize: 25.2)),
                Text("-", style: TextStyle(fontSize: 25.2)),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("7", style: TextStyle(fontSize: 25.2)),
                Text("8", style: TextStyle(fontSize: 25.2)),
                Text("9", style: TextStyle(fontSize: 25.2)),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("4", style: TextStyle(fontSize: 25.2)),
                Text("5", style: TextStyle(fontSize: 25.2)),
                Text("6", style: TextStyle(fontSize: 25.2)),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("1", style: TextStyle(fontSize: 25.2)),
                Text("2", style: TextStyle(fontSize: 25.2)),
                Text("3", style: TextStyle(fontSize: 25.2)),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    flex: 1, child: Text("0", style: TextStyle(fontSize: 25.2))),
                Flexible(
                    flex: 5,
                    fit: FlexFit.loose,
                    child: Text("=", style: TextStyle(fontSize: 25.2))),
              ],
            )],),
          )
          
      ],
      ),
    );
  }
}
