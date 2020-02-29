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
  final bool isPositive = area >= 0;

  final String parsedYear = _padZero(year, 4);
  final String parsedMonth = _padZero(month, 2);
  final String parsedDay = _padZero(day, 2);

  final String parsedHour = _padZero(hour, 2);
  final String parsedMinute = _padZero(minute, 2);
  final String parsedSecond = _padZero(second, 2);

  final String parsedArea = area.abs().toString();

  final String areaStr = isPositive ? '+' + parsedArea : '-' + parsedArea;

  return "$parsedYear-$parsedMonth-$parsedDay $parsedHour:$parsedMinute:$parsedSecond (UTC${areaStr})";
}
