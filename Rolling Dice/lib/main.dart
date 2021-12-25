import 'package:flutter/material.dart';

import 'Rolling_Dice.dart';

void main() {
  runApp(Dice());
}

class Dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
