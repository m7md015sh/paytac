import 'package:get/get.dart';
import 'package:paytac/controllers/auth/login_controller.dart';
import 'package:paytac/controllers/auth/signup_controller.dart';



class  LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}