import 'package:intl/intl.dart';

class TimeParser {
  String date;
  String time;

  TimeParser({
    required this.time,
    required this.date,
  });

  // String apiTime = "21:00";
  // DateFormat apiTimeFormat = DateFormat("HH:mm");
  // DateTime apiDateTime = apiTimeFormat.parse(apiTime);
  // String localTimeZone = DateTime.now().timeZoneName;
  // DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  // DateTime localDateTime = apiDateTime.toLocal();
  // DateTime yesterday = localDateTime.subtract(Duration(days: 1));
  // String yesterdayDate = dateFormat.format(yesterday);
  // DateTime tomorrow = localDateTime.add(Duration(days: 1));
  // String tomorrowDate = dateFormat.format(tomorrow);

  static String toLocal(String apiTime) {
    DateFormat apiTimeFormat = DateFormat("HH:mm");
    DateTime apiDateTime = apiTimeFormat.parse(apiTime);
    DateTime res = apiDateTime.add(const Duration(hours: 3));
    return hourFormatter(res);
  }

  static String hourFormatter(DateTime date) {
    String hourRes = "";
    String minRes = "";
    final hour = date.hour;
    final min = date.minute;
    if (hour < 10) {
      hourRes = "0$hour";
    } else {
      hourRes = "$hour";
    }
    if (min < 10) {
      minRes = "0$min";
    } else {
      minRes = "$min";
    }
    return "$hourRes:$minRes";
  }

  static TimeParser parse(String time) {
    final date = DateTime.parse(time);
    final month = date.month < 10 ? "0${date.month}" : "${date.month}";
    final day = date.day < 10 ? "0${date.day}" : "${date.day}";
    final min = date.minute < 10 ? "0${date.minute}" : "${date.minute}";
    final hour = date.hour < 10 ? "0${date.hour}" : "${date.hour}";
    return TimeParser(
      time: "$hour:$min",
      date: "$day.$month.${date.year}",
    );
  }
}
