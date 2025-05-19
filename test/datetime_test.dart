import 'package:flutter_test/flutter_test.dart';
import 'package:medb/common/datetime.dart';

void main() {
  test('将 UTC 时间字符串转为当地时间字符串', () {
    const utcString = '2025-05-19T08:31:36Z'; // UTC 时间
    const expected = '2025/05/19 16:31'; // 北京时间 (UTC+8)
    expect(dateTimeToString(utcString), equals(expected));
  });
}
