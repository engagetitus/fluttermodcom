import 'package:flutter/material.dart';
import 'package:soko/api/products.dart';

import '../controller/api.dart';

class Oneproduct extends StatefulWidget {
  const Oneproduct({super.key, required this.product_id});
  final int product_id;
  @override
  State<Oneproduct> createState() => _OneproductState();
}

class _OneproductState extends State<Oneproduct> {
  @override
  Widget build(BuildContext context) {
    // a future builder - widget that builds itself based on the latest snapshot of interaction with a future

    // 1. FUTURE - an object representing a potential value or error
    // 2. Snapshot - Represents the state of the future (connectionState, data,error)
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: FutureBuilder(
          future: fetchProductbyId(widget.product_id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // show loadind
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // show error
              return Text('Error ${snapshot.error.toString()}');
            } else {
              // show our data.
              var data = snapshot.data;
              // Buid our UI
              return Column(
                children: [
                  Text(data.toString()),
                  Image.network(
                    '$baseurl/static/images/',
                    scale: 2.5,
                  ),
                  const Text('Product Name'),
                  const Text('Product Price'),
                  const Text('product_description'),
                  TextButton.icon(onPressed: () {}, label: const Text('Buy'))
                ],
              );
            }
          }),
    );
  }
}
