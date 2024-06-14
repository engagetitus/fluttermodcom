import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextStyle styleBig = TextStyle(fontSize: 40);

  int? num1 = 1;
  int? num2 = 4;
  List n123 = [1, 2, 3];

  int add() {
    int add1 = num2 ?? 0;
    return num1 ?? 0 + add1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        leading: Icon(Icons.menu),
        title: Row(
          children: [
            Text("Standard"),
            IconButton(onPressed: () {}, icon: Icon(Icons.apps))
          ],
        ),
        actions: [Icon(Icons.refresh)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Text(
                    "$num1 + $num2",
                    style: styleBig,
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    add().toString(),
                    style: styleBig,
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        num1 = null;
                        // num2 = null;
                      },
                      child: Text(
                        "CLEAR",
                        style: styleBig,
                      ),
                    ),
                    Text(
                      "+",
                      style: styleBig,
                    ),
                    Text(
                      "-",
                      style: styleBig,
                    ),
                  ],
                )
                // 789
                ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        num1 = 7;
                        setState(() {});
                      },
                      child: Text(
                        "7",
                        style: styleBig,
                      ),
                    ),
                    Text(
                      "8",
                      style: styleBig,
                    ),
                    Text(
                      "9",
                      style: styleBig,
                    ),
                  ],
                ),

                //456
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "4",
                      style: styleBig,
                    ),
                    Text(
                      "5",
                      style: styleBig,
                    ),
                    Text(
                      "6",
                      style: styleBig,
                    ),
                  ],
                ),

                //123
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        n123.length,
                        (index) => GestureDetector(
                              onTap: () {
                                num1 = n123[index];
                                setState(() {});
                              },
                              child: Text(
                                n123[index].toString(),
                                style: styleBig,
                              ),
                            ))),

                //0 =
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      styleBig: styleBig,
                      text: '0',
                    ),
                    Button(
                      styleBig: styleBig,
                      text: '=',
                    ),
                  ],
                )
              ],
            ),
          ),

          // clear + -
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.styleBig,
    required this.text,
  });

  final TextStyle styleBig;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white12,
      child: SizedBox(
        width: 100,
        child: Center(
          child: Text(
            text,
            style: styleBig.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
