import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soko/api/products.dart';

import '../controller/api.dart';
import 'create_product.dart';
import 'single_product.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    super.initState();
    getproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Createproduct()));
              },
              icon: const Icon(Icons.edit_note)),
          IconButton(
              onPressed: () {
                initState();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
          future: getproducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              var data = snapshot.data;
              if (data == null) {
                return Text('No Products Found');
              } else {
                var products = data;
                return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Oneproduct(
                                        product_id: products[index][0],
                                      )));
                        },
                        leading: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.network(
                              "$baseurl/static/images/${products[index][5]}",
                              scale: 2,
                            )),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Product Name : ${products[index][1]}'),
                            Text(
                              'Product Description : ${products[index][2]}',
                              overflow: TextOverflow.visible,
                            ),
                            Text(
                                'Product Price : KSH ${products[index][3].toString()}'),
                          ],
                        ),
                      );
                    });
              }
            }
          }),
    );
  }
}
