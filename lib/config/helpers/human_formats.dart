import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double value, [int decimals = 0]) {
    return NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en',
    ).format(value);
  }
}
