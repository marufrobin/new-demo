import 'package:intl/intl.dart';

class AppDateTimeFormat {
  static String dayName({DateTime? date}) {
    return date == null
        ? "No date!"
        : DateFormat("EEEE").format(date.toLocal());
  }

  static String dateFormat({DateTime? date}) {
    return date == null
        ? "No date!"
        : DateFormat("dd MMMM, yyyy").format(date.toLocal());
  }

  static String dateFormatV2({DateTime? date}) {
    return date == null
        ? "No date!"
        : DateFormat("dd.MM.yy").format(date.toLocal());
  }

  static String dateFormatV3({DateTime? date}) {
    return date == null
        ? "No date!"
        : DateFormat("yyyy-MM-dd").format(date.toLocal());
  }

  static String timeFormat({DateTime? time}) {
    // 12 hours format
    // return time == null ? "No date!" : DateFormat("hh:mm a").format(time);
    return time == null ? "No time!" : DateFormat.jm().format(time.toLocal());
  }

  static String dateAndTimeFormat({DateTime? datetime}) {
    return datetime == null
        ? "No date & time!"
        : DateFormat("dd MMMM, yyyy | hh:mm a").format(datetime.toLocal());
  }

  static String dateAndTimeFormatV2({DateTime? datetime}) {
    return datetime == null
        ? "No date & time!"
        : DateFormat("dd MMM, yy | hh:mm a").format(datetime.toLocal());
  }

  DateTime getDateTimeFromString(String dateTimeString) {
    final int days = int.tryParse(dateTimeString) ?? 0;
    final today = DateTime.now();
    final targetDate = today.add(Duration(days: days));
    return targetDate;
  }
}
