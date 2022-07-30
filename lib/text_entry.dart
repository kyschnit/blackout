import 'package:flutter/material.dart';
import 'package:blackout/blackout_select.dart';

class TextEntry extends StatefulWidget {
  const TextEntry({Key? key}) : super(key: key);

  @override
  State<TextEntry> createState() => _TextEntryState();
}

class _TextEntryState extends State<TextEntry> {
  bool buttonEnable = false;
  final textController = TextEditingController();

  void sendText(BuildContext context) {
    String toSend = textController.text.replaceAll('\n', ' ');
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Enter text to create a poem from.',
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
                child: TextField(
                  controller: textController,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Paste your text here',
                  ),
                  onChanged: (value) {
                    setState(() {
                      buttonEnable = (value.isNotEmpty ? true : false);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: buttonEnable
                    ? () {
                        sendText(context);
                      }
                    : null,
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
