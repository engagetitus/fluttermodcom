import 'package:leaveapp/custom widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:leaveapp/custom widgets/lists.dart';

class Application extends StatefulWidget {
  const Application({super.key});
  

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

var selectedtype = applications[0];





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appbar(title: 'Make Applications'),

      body: Column(
        children:[
          Form(
            child: Column(
              children: [
                
                
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter your userId',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField(
                    value:  applications[0],
            
            
                    items: applications.map((String item) {
                      return DropdownMenuItem(
                          enabled: selectedtype != item,
                          value: item,
                          alignment: Alignment.topLeft,
                          child: Text(item));
                    }).toList(),
            
                   
            
                    decoration: const InputDecoration(
                      labelText: 'Select your application type',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.book),
                    ),
            
            
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedtype = newValue!;
                      });
                    }),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter your remarks',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.book),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),


              ],
            ),
          ),


          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: ElevatedButton(onPressed: (){},style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.indigoAccent)), child: const Text('Apply')),
                ),
              ),
            ],
          )

        ]
      ),
    );
  }
}