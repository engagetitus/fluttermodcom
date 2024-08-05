import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Statements extends StatefulWidget {
  const Statements({super.key});

  @override
  State<Statements> createState() => _StatementsState();
}

class _StatementsState extends State<Statements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: StreamBuilder(
        stream: getdata(), 
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          else if(snapshot.connectionState == ConnectionState.active){
            if(!snapshot.hasData || snapshot.data.docs.isEmpty){
              return const SizedBox(height: 200, child: Center(child: Text('No statements found')));
            }
            else{
              var data = snapshot.data.docs;
            
            
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: 
                DataTable(
                  columns: const[
                    DataColumn(label: Text('Reference')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Amount')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Status'))
                
                  ], rows: 
                  List<DataRow>.generate(data.length, (index){
                    return DataRow(cells: [
                      DataCell(Text(data[0].data()['reference'].toString())),
                      DataCell(Text(data[0].data()['type'].toString())),
                      DataCell(Text(data[0].data()['amount'].toString())),
                      DataCell(Text(DateFormat().format(DateTime.parse(data[0].data()['date'])))),
                      DataCell(Text(data[0].data()['status'].toString())),
                    ]);
                  })
                  
                  
                  
                  
                  
                   
                  
                  
                  ),
              );

            }




            
            
          }
          else{
            return const Text('Error occurred');
          }
        }) ,

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add Statement'),
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const AddStatement()));
        }),

    );
  }
}

class AddStatement extends StatefulWidget {
  const AddStatement({super.key});

  @override
  State<AddStatement> createState() => _AddStatementState();
}

class _AddStatementState extends State<AddStatement> {
  final amount = TextEditingController();
  final reference = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Statement'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          var isValid = formKey.currentState!.validate();
          if(isValid){
            poststatement({
              'amount':amount.text,
              'reference': reference.text,
              'type': 'Debit',
              'date': DateTime.now().toString(),
              'status': 'pending',
            });
            Navigator.pop(context);
          }

        }, 
        label: const Text('Save')),

      body: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: amount,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.money),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Amount is required';
                      }
                      else if(double.tryParse(value) == null){
                        return 'Amount must be a valid number';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: reference,
                    decoration: const InputDecoration(
                      labelText: 'Bank/Mpesa Reference Number',
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.money),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Reference number is required';
                      }
                      else{
                        return null;
                      }
                  
                  
                  
                    },
                  
                  
                  
                  ),
                )
              ],
            )),

            
        ],
      )


    );
  }
}

Stream <QuerySnapshot<Map<String,dynamic>>> getdata() {
return FirebaseFirestore.instance.collection('Bank Statements').snapshots();
}

Future poststatement(Map<String, dynamic> map)async{
 String userId = const Uuid().v1();
  return await FirebaseFirestore.instance.collection('Bank Statements').doc(userId).set(map);
}

