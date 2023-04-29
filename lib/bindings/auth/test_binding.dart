import 'package:get/get.dart';
import 'package:paytac/controllers/auth/login_controller.dart';
import 'package:paytac/controllers/auth/signup_controller.dart';
import 'package:paytac/controllers/text_controller.dart';



class  TextBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TestController());
  }

}