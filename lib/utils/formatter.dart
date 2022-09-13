import 'package:intl/intl.dart';

NumberFormat formatter = NumberFormat(',###', 'en_US');
String currency = "UGX.";

class CustomDateFormatter {
  static String getVerboseDateTimeRepresentation(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime justNow = now.subtract(const Duration(minutes: 1));
    DateTime localDateTime = dateTime.toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return "Just now";
    }

    String roughTimeString = DateFormat('jm').format(dateTime);

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return roughTimeString;
    }

    DateTime yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return "Yesterday";
    }

    if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE', 'en_US').format(localDateTime);

      return '$weekday, $roughTimeString';
    }

    // return '${DateFormat('MMM d', 'en_US').format(dateTime)}, $roughTimeString';
    return DateFormat('MMM d', 'en_US').format(dateTime);
  }
}
