abstract class TimeFormatter {
  static format(int rawTime) {
    final secondsRaw = (rawTime / 1000).truncate();
    final minutesRaw = (secondsRaw / 60).truncate();
    final hourRaw = (minutesRaw / 60).truncate();

    final sseconds = (secondsRaw % 60).toString().padLeft(2, '0');
    final sMinutes = (minutesRaw % 60).toString().padLeft(2, '0');
    final hour = (hourRaw % 60).toString().padLeft(2, '0');

    return '$hour:$sMinutes:$sseconds';
  }
}
