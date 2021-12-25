import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() {
  runApp(SppechToText());
}

class SppechToText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}
