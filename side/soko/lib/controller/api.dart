import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api/products.dart';

Future getoneproduct(int id, BuildContext context) async {
  try {
    http.Response feedback =
        await http.get(Uri.parse('$baseurl/api/single_item/$id'));
    if (feedback.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Succesful')));

      return jsonDecode(feedback.body);
    }
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future fetchProductbyId(int id) async {
  http.Response feedback = await http.post(
      Uri.parse(
        '$baseurl/api/single_item',
      ),
      body: json.encode({'id': id}));
  if (feedback.statusCode == 200) {
    return feedback.body;
  } else {
    return null;
  }
}

Future getproducts() async {
  http.Response response = await http.get(Uri.parse('$baseurl/ap/products'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return null;
  }
}
