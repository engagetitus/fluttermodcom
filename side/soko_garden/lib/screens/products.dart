import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soko_garden/screens/createproduct.dart';
import 'package:soko_garden/screens/oneproduct.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}



class _ProductsState extends State<Products> {
  

  List products =[];
  List one = [];
  Future getproducts() async{
    http.Response response = await http.get(Uri.parse('https://soko.titus.co.ke/api/products'));
    if(response.statusCode == 200){
        if(mounted){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('Succesful')));
        }
        else{}
        products = jsonDecode(response.body);
    }
  }

  Future getoneproduct(int id) async{
    try{
      http.Response feedback = await http.get(Uri.parse('https://soko.titus.co.ke/api/products/$id'));
    if(feedback.statusCode == 200){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('Succesful')));
      }
      else{}
      one = jsonDecode(feedback.body);
  }
    }
    catch(e){
      if(mounted){
         ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:  Text(e.toString())));
      }
      
    }
  
  
  }



@override
  void initState() {
    super.initState();
    getproducts();
  }



  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const Createproduct()));
            }, icon: const Icon(Icons.edit_note)),
          IconButton(onPressed: (){getproducts();}, icon: const Icon(Icons.refresh)) ],
      ),
      body : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              getoneproduct(products[index][0]);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Oneproduct(oneproduct: one,)));
              
            },


            leading:  SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
              child: Image.network("https://soko.titus.co.ke/static/images/${products[index][5]}",scale: 2, )),
           
            subtitle:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product Name : ${products[index][1]}'),
                    Text('Product Description : ${products[index][2]}',overflow: TextOverflow.visible,),
                    Text('Product Price : KSH ${products[index][3].toString()}'),
                    
                  ],
                ),
            
          
          );
        }),

      

    );
  }
}