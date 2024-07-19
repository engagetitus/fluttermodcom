import 'package:flutter/material.dart';
import 'package:todosql/controller/sql/db_helpers.dart';
import 'package:todosql/screens/addtasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Your Tasks'),),),

      body: FutureBuilder(
        future: retrieveTodos(),
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }
        else if(snapshot.hasError){
          return Text('${snapshot.error}');
        }
        else if(snapshot.hasData){
          var data = snapshot.data;
          if(data == null){
            return const Text('Nothing found');
          }
          else{
           
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index){
              var todo = snapshot.data![index];
              
              return ListTile(
                title: Text(todo['title'].toString()),
                subtitle:  Text(todo['description'].toString()),
                trailing: Checkbox(
                  value: todo['isComplete'] == 1 ?  true :false, 
                  onChanged: (v){
                 
                })
              );
          
            });
          }
        }
        else{
          return const Text('No data found');
        }



        }
      ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const Addtasks()));
          },
          child: const Icon(Icons.add),
          ),  

  


    );
  }
}