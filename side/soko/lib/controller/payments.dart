import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api/products.dart';

Future mpesa(double amount, String phone) async {
  http.Response response = await http.post(
      Uri.parse(
        '$baseurl/api/mpesa',
      ),
      body: json.encode({'amount': amount, 'phone': phone}),
      headers: {'Content-type': 'application/json'});
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return null;
  }
}
