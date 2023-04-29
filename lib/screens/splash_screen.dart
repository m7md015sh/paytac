import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac/controllers/auth/auth_controller.dart';
import 'package:paytac/core/constant/routes_const.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  AuthController controller=Get.find();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 600),(){
      if(controller.isAuth()){
        Get.offAllNamed(RoutesConst.home);

      }else {
        Get.offAllNamed(RoutesConst.login,);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
