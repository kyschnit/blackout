import 'package:flutter/material.dart';

class Word extends StatefulWidget {
  const Word({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<Word> createState() => _WordState();
}

class _WordState extends State<Word> {
  bool _blackedOut = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _blackedOut = !_blackedOut;
        });
      },
      child: Container(
        color: _blackedOut ? Colors.black : Colors.white,
        child: Text(widget.text)
      ),
    );
  }
}
