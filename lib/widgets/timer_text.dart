import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weekly_timetrack/helpers/time_formatter.dart';

class TimerText extends StatefulWidget {
  final Stopwatch stopwatch;
  TimerText({this.stopwatch});

  @override
  _TimerTextState createState() => _TimerTextState(stopwatch: stopwatch);
}

class _TimerTextState extends State<TimerText> {
  final Stopwatch stopwatch;

  _TimerTextState({this.stopwatch}) {
    Timer.periodic(new Duration(milliseconds: 30), callback);
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final sec = TimeFormatter.format(stopwatch.elapsedMilliseconds);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          sec,
          style: TextStyle(fontSize: 75),
        ),
      ],
    );
  }
}
