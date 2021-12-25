import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SpeechToText stt = SpeechToText();
  bool isListening = false;
  String text = '';

  @override
  void initState() {
    super.initState();
    initializeAudio();
  }

  initializeAudio() async {
    isListening = await stt.initialize();
  }

  void startListening() async {
    await stt.listen(onResult: onSpeechResult);
    setState(() {});
  }

  void stopListening() async {
    await stt.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      text = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech to text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Tap the button to Speak',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(16),
              child: Text(
                stt.isListening ? '$text' : text,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: stt.isNotListening ? startListening : stopListening,
        child: Icon(stt.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}
