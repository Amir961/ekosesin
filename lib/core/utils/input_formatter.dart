

import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  final String prefix;
  PhoneNumberFormatter(this.prefix);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // اگه کاربر سعی کرد کمتر از "۰۹" وارد کنه، برمی‌گردیم به همون قبلی
    if (!newValue.text.startsWith(prefix)) {
      return oldValue;
    }

    // نذار بیشتر از ۱۱ رقم وارد شه
    if (newValue.text.length > 11) {
      return oldValue;
    }

    return newValue;
  }
}


class NationalFormatter extends TextInputFormatter {

  NationalFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {


    // نذار بیشتر از ۱۱ رقم وارد شه
    if (newValue.text.length > 10) {
      return oldValue;
    }

    return newValue;
  }
}