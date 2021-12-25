import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() {
  runApp(const TipCalculator());
}

class TipCalculator extends StatelessWidget {
  const TipCalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
