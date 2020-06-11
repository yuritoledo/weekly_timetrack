import 'package:flutter/material.dart';

class PlayPause extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  PlayPause({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 120,
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
