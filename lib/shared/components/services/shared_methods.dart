import 'package:intl/intl.dart';

class SharedMethods {
  static String formatDate(String date) {
    return DateFormat.yMMMMd()
        .format(DateTime.parse(date));
  }
  static int timeLeft(String input) {
    DateTime date = DateTime.parse(input);
    Duration diff = date.difference(DateTime.now());
    return diff.inHours;
  }
  static double timeLeftPercentage(String input) {
    DateTime date = DateTime.parse(input);
    Duration diff = date.difference(DateTime.now());
    double percentage = 1 - diff.inDays / (date.day * 60);
    print(percentage);
    print(date.day);
    return percentage;
  }
}
