import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() {
  runApp(const DataFetching());
}

class DataFetching extends StatelessWidget {
  const DataFetching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
