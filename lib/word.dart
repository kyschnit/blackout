import 'package:flutter/material.dart';

class Word extends StatefulWidget {
  const Word({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<Word> createState() => _WordState();
}

class _WordState extends State<Word> {
  bool _blackedOut = false;
  bool _hovered = false;

  void _hover(PointerEvent e) {
    setState(() {
      _hovered = !_hovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _blackedOut = !_blackedOut;
        });
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
              border: Border.all(
                  color: _blackedOut || _hovered
                      ? Colors.black
                      : Colors.transparent)),
          child: MouseRegion(
              onEnter: _hover,
              onExit: _hover,
              child: Text(style: const TextStyle(fontSize: 25), widget.text))),
    );
  }
}
