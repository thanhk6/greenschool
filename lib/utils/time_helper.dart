import 'package:intl/intl.dart';

abstract class TimeHelper {
  static String getTime(DateTime dateTime) {
    return DateFormat("dd/MM/yyyy HH:mm").format(dateTime);
  }
}
