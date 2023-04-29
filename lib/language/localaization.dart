import 'package:get/get.dart';
import 'package:paytac/language/ar.dart';
import 'package:paytac/language/en.dart';


import '../core/constant/app_constants.dart';



class LocalizationApp extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
   AppConstants.ara: ar,
    AppConstants.en:en,
};

}