import 'package:flutter/material.dart';

class SearchConv extends StatefulWidget {
  const SearchConv({super.key});

  @override
  State<SearchConv> createState() => _SearchConvState();
}

class _SearchConvState extends State<SearchConv> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
    );
  }
}
