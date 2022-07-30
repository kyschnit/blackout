import 'package:flutter/material.dart';
import 'package:blackout/text_entry.dart';

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
          title: const Text('Blackout Poetry'),
        ),
        body: const SingleChildScrollView(
          child: TextEntry(),
        ),
      ),
    );
  }
}
