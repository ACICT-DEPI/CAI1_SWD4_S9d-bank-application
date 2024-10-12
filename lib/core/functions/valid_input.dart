import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return '159'.tr;
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return '160'.tr;
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return '161'.tr;
    }
  }
  if (val.isEmpty) {
    return '165'.tr;
  }
  if (val.length < min) {
    return '${'166'.tr}$min${'167'.tr}';
  }
  if (val.length > max) {
    return '${'168'.tr}$max${'167'.tr}';
  }
  if (type == 'amount') {
    if (!GetUtils.isNumericOnly(val)) {
      return '162'.tr;
    }
  }
  if (type == 'content') {}
}
