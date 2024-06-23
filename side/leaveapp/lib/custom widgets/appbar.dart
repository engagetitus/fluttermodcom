
import 'package:flutter/material.dart';

PreferredSizeWidget appbar(
  {required String title}
)

{
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: AppBar(
      title: Center(child: Text(title)),
      
    ),
  );
}