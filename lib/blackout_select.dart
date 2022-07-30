import 'package:flutter/material.dart';
import 'package:blackout/word.dart';

class BlackoutSelect extends StatefulWidget {
  const BlackoutSelect({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<BlackoutSelect> createState() => _BlackoutSelectState();
}

class _BlackoutSelectState extends State<BlackoutSelect> {
  List<Word> _separateText(String text) {
    List<String> textSeparated = text.split(' ');
    List<Word> wordsSeparated = [];
    for (String word in textSeparated) {
      wordsSeparated.add(Word(text: word));
    }
    return wordsSeparated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blackout Poetry'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Select the words you want to keep.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 4,
                      runSpacing: 4,
                      children: _separateText(widget.text)),
                ),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Next'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
