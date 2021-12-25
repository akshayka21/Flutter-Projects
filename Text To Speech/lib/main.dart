import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() {
  runApp(const TextToSpeech());
}

class TextToSpeech extends StatelessWidget {
  const TextToSpeech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
