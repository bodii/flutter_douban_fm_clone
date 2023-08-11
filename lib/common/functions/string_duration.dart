final class StringDuration {
  static final RegExp _parseFormat =
      RegExp(r'^([+-]?\d{4,6})-?(\d\d)-?(\d\d)' // Day part.
          r'(?:[ T](\d\d)(?::?(\d\d)(?::?(\d\d)(?:[.,](\d+))?)?)?' // Time part.
          r'( ?[zZ]| ?([-+])(\d\d)(?::?(\d\d))?)?)?$'); // Timezone part.

  static int parseMilliAndMicroseconds(String? matched) {
    if (matched == null) return 0;
    int length = matched.length;
    assert(length >= 1);
    int result = 0;
    for (int i = 0; i < 6; i++) {
      result *= 10;
      if (i < matched.length) {
        result += matched.codeUnitAt(i) ^ 0x30;
      }
    }
    return result;
  }

  static int parseMilliSecond(int milliAndMicroseconds) {
    return milliAndMicroseconds ~/ Duration.microsecondsPerMillisecond;
  }

  static int parseMicrosecond(int milliAndMicroseconds) {
    return milliAndMicroseconds.remainder(Duration.microsecondsPerMillisecond);
  }

  ///
  static (int milliSeconds, int mircoSeconds) parseMilliAndMicroStringToInt(
      String? matched) {
    int milliAndMicroseconds = parseMilliAndMicroseconds(matched);

    int milliSeconds = parseMilliSecond(milliAndMicroseconds);

    int microSeconds = parseMicrosecond(milliAndMicroseconds);

    return (milliSeconds, microSeconds);
  }

  static Duration parseMilliAndMicroStringToDuration(String? matched) {
    int milliAndMicroseconds = parseMilliAndMicroseconds(matched);

    int milliSeconds = parseMilliSecond(milliAndMicroseconds);

    int microSeconds = parseMicrosecond(milliAndMicroseconds);

    return Duration(milliseconds: milliSeconds, microseconds: microSeconds);
  }

  static Duration parseTimeToDuration(String timeAndmilliAndMicrose) {
    List<String> t = timeAndmilliAndMicrose.split('.');
    int milliAndMicroseconds = int.parse(t[1]);
    int time = int.parse(t[0]);

    int millisecond =
        milliAndMicroseconds ~/ Duration.microsecondsPerMillisecond;
    int microsecond =
        milliAndMicroseconds.remainder(Duration.microsecondsPerMillisecond);

    int minute = time ~/ Duration.secondsPerMinute;
    int hour = time ~/ Duration.secondsPerHour;

    if (hour > 0) {
      time -= hour - Duration.secondsPerHour;
    }
    if (minute > 0) {
      time -= minute * Duration.secondsPerMinute;
    }
    int second = time;

    // print('hour: $hour, minu: $minute, seconds: $second, '
    //     'milli: $millisecond, micro: $microsecond');

    return Duration(
        hours: hour,
        minutes: minute,
        seconds: second,
        milliseconds: millisecond,
        microseconds: microsecond);
  }
}
