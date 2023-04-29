import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "name" && val.length < min) {
    return "not Valid name";
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not Valid Phone Number";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not Valid Email";
    }
  }
  if (val.isEmpty) {
    return "can't be Empty ";
  }
  if (val.length < min) {
    return "value can't be less than $min";
  }
  if (val.length > max) {
    return "value can't be larger than $max";
  }
}
