abstract class TimeFormatter {
  static format(int rawTime) {
    final secondsRaw = (rawTime / 1000).truncate();
    final minutesRaw = (secondsRaw / 60).truncate();
    final hourRaw = (minutesRaw / 60).truncate();

    final sseconds = formatWithZeros(secondsRaw);
    final sMinutes = formatWithZeros(minutesRaw);
    final hour = formatWithZeros(hourRaw);

    return '$hour:$sMinutes:$sseconds';
  }

  static String formatWithZeros(int infoRaw) {
    return (infoRaw % 60).toString().padLeft(2, '0');
  }
}
