class DailyTimer {
  final String id;
  final String time;
  final DateTime starterHour;

  String get starterHourString {
    final s = starterHour;
    final str = 'Dia ${s.day}, às ${s.hour}:${s.minute}';
    return str;
  }

  DailyTimer({this.id, this.time, this.starterHour});
}
