import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int DiceNumber = 1;

  void roll() {
    setState(() {
      DiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Role Dice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: roll,
                      child: Image.asset(
                        'assets/dice-$DiceNumber.jpg',
                        height: 100,
                        width: 100,
                      )),
                )
              ],
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: roll,
              child: Text('Rolll'),
            )
          ],
        ),
      ),
    );
  }
}
