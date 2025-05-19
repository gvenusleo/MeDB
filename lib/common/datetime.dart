/// 时间字符串转换
/// 输入: 2025-05-19T08:31:36Z
/// 输出: 2025/05/19 16:31
String dateTimeToString(String dateTime) {
  final DateTime? result = DateTime.tryParse(dateTime)?.toLocal();
  if (result == null) {
    return dateTime;
  }
  return '${result.year}/${result.month.toString().padLeft(2, '0')}/${result.day.toString().padLeft(2, '0')}'
      ' ${result.hour.toString().padLeft(2, '0')}:${result.minute.toString().padLeft(2, '0')}';
}
