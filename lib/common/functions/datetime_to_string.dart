extension DateTimeToString on DateTime {
  static const Map<int, String> monthsZh = {
    1: '一月',
    2: '二月',
    3: '三月',
    4: '四月',
    5: '五月',
    6: '六月',
    7: '七月',
    8: '八月',
    9: '九月',
    10: '十月',
    11: '十一月',
    12: '十二月',
  };

  static const Map<int, String> monthsEnAbridged = {
    1: 'Jan.',
    2: 'Feb.',
    3: 'Mar.',
    4: 'Apr.',
    5: 'May.',
    6: 'Jun.',
    7: 'Jul.',
    8: 'Aug.',
    9: 'Sept.',
    10: 'Oct.',
    11: 'Nov.',
    12: 'Dec.',
  };

  static const Map<int, String> monthsEn = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };

  String toMonthEn() {
    return monthsEn[month]!;
  }

  String toMonthEnAbridged() {
    return monthsEnAbridged[month]!;
  }

  String toMonthZh() {
    return monthsZh[month]!;
  }
}
