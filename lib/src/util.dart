String _padZero(int value, int digits) {
  final String parsed = value.toString();
  final int difference = digits - parsed.length;

  if (difference > 0) {
    final String fill = '0' * difference;
    return fill + parsed;
  }

  return parsed;
}

String appropriateDateStringWithTime(DateTime date) {
  final int year = date.year;
  final int month = date.month;
  final int day = date.day;

  final int hour = date.hour;
  final int minute = date.minute;
  final int second = date.second;

  final int area = date.timeZoneOffset.inHours;
}
