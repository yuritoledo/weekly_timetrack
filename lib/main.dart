import 'package:flutter/material.dart';
import 'package:weekly_timetrack/pages/home.dart';

void main () {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekly time tracking',
      home: Home(),
    );
  }
}