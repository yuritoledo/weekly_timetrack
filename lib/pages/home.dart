import 'package:flutter/material.dart';
import 'package:weekly_timetrack/widgets/timer_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _stopwatch = Stopwatch();
  IconData _icon = Icons.play_circle_outline;

  Function _callDynamicClick;

  _HomeState() {
    _callDynamicClick = _stopwatch.start;
  }

  onPressed() {
    _callDynamicClick();
    toggleStatus();
  }

  toggleStatus() {
    var icon;
    var callDynamicClick;

    if (_stopwatch.isRunning) {
      icon = Icons.pause;
      callDynamicClick = _stopwatch.stop;
    } else {
      icon = Icons.play_circle_outline;
      callDynamicClick = _stopwatch.start;
    }

    setState(() {
      _icon = icon;
      _callDynamicClick = callDynamicClick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Week 2'),
      ),
      body: Container(
          child: Row(children: <Widget>[
        TimerText(
          stopwatch: _stopwatch,
        ),
        Actions(icon: _icon, onPressed: onPressed),
      ])),
    );
  }
}

class Actions extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  Actions({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
