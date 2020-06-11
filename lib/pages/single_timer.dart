import 'package:flutter/material.dart';
import 'package:weekly_timetrack/models/daily_timer.dart';
import 'package:weekly_timetrack/widgets/timer_text.dart';
import 'package:weekly_timetrack/widgets/play_pause.dart';

class SingleTimer extends StatefulWidget {
  final DailyTimer dailyTimer = DailyTimer();
  SingleTimer(dailyTimer);

  @override
  _SingleTimerState createState() => _SingleTimerState(dailyTimer);
}

class _SingleTimerState extends State<SingleTimer> {
  final DailyTimer dailyTimer;
  final _stopwatch = Stopwatch();
  IconData _icon = Icons.play_circle_outline;

  Function _callDynamicClick;

  _SingleTimerState(this.dailyTimer) {
    print(dailyTimer.starterHour);
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
        title: Text('Week ${dailyTimer.id}'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StartedAt(),
            TimerText(
              stopwatch: _stopwatch,
            ),
            PlayPause(icon: _icon, onPressed: onPressed),
          ]),
    );
  }
}

class StartedAt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final h = date.hour, m = date.minute;
    return Container(
      child: Text('Esse timer começou em: $h:$m'),
    );
  }
}
