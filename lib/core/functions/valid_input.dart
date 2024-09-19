import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'Invalid username';
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'Invalid email';
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Invalid phone number';
    }
  }
  if (val.isEmpty) {
    return 'Can\'t be empty';
  }
  if (val.length < min) {
    return 'Minimum $min characters required';
  }
  if (val.length > max) {
    return 'Maximum $max characters allowed';
  }
  if (type == 'amount') {
    if (!GetUtils.isNumericOnly(val)) {
      return 'Invalid amount';
    }
  }
  if (type == 'content') {}
}
