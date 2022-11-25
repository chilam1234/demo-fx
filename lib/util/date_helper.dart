import 'package:intl/intl.dart';

extension DateTimeAgo on DateTime {
  static final defaultDateFormat = DateFormat('yyyy-MM-dd');

  String dateAgo() {
    final dateDiff = DateTime.now().difference(this);
    if (dateDiff.inDays <= 0) {
      return '${dateDiff.inHours} hours ago';
    } else if (dateDiff.inDays < 30) {
      return '${dateDiff.inDays} days ago';
    } else {
      return defaultDateFormat.format(this);
    }
  }
}