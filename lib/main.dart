import 'package:flutter/material.dart';
import './word.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blackout',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Blackout Poetry"),
        ),
        body: const SingleChildScrollView(
          child: TextEntry(),
        ),
      ),
    );
  }
}

class TextEntry extends StatefulWidget {
  const TextEntry({Key? key}) : super(key: key);

  @override
  State<TextEntry> createState() => _TextEntryState();
}

class _TextEntryState extends State<TextEntry> {
  bool buttonEnable = false;
  final textController = TextEditingController();

  void sendText(BuildContext context) {
    String toSend = textController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlackoutSelect(text: toSend),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: textController,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Paste your text here",
            ),
            onChanged: (value) {
              setState(() {
                buttonEnable = (value.isNotEmpty ? true : false);
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: buttonEnable
                ? () {
                    sendText(context);
                  }
                : null,
            child: const Text("Next"),
          ),
        ),
      ],
    );
  }
}

class BlackoutSelect extends StatefulWidget {
  const BlackoutSelect({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<BlackoutSelect> createState() => _BlackoutSelectState();
}

class _BlackoutSelectState extends State<BlackoutSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blackout Poetry"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(15),
                child: Column(children: separateText(widget.text))),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Word> separateText(String text) {
  List<String> textSeparated = text.split(' ');
  List<Word> wordsSeparated = [];
  for (String word in textSeparated) {
    wordsSeparated.add(Word(text: word));
  }
  return wordsSeparated;
}
