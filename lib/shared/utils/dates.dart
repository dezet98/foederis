import 'package:intl/intl.dart';

String formatDate(String dateFormat, DateTime date) {
  return DateFormat(dateFormat).format(date);
}
