import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:paytac/core/constant/app_constants.dart';
import 'package:paytac/core/constant/routes_const.dart';
import 'package:paytac/data/models/auth/login_model.dart';
import 'package:paytac/data/services/auth_service.dart';

class LoginController extends GetxController{
  final loginFormKey=GlobalKey<FormState>();
  late TextEditingController emailController,passwordController;
  final storage =  const FlutterSecureStorage();
  var isLoading=false;
  @override
  void onInit() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  doLogin() async {


    bool isValidate= loginFormKey.currentState!.validate();
    if(isValidate){
      isLoading=true;
      update();
      try{
        LoginModel data=await AuthServices.login( email: emailController.text, password: passwordController.text);
        if(data!=null) {

          print("===============${data.data.firstName}====================");
          await storage.write(key: "name",value: data.data.firstName);
          await storage.write(key: "token",value: data.data.token);
          AppConstants.TOKEN=data.data.token;
          AppConstants.NAME=data.data.firstName;
          //loginFormKey.currentState!.save();
          //loginFormKey.currentState!.save();
          await Get.offNamed(RoutesConst.home);
          update();
        }else{
          print(data);
          Get.snackbar('Login', 'you have something error in login');
          update();
        }

      }finally{


        isLoading=false;
        update();



      }
    }
  }
  bool isPasswordSecure=true;
  void changeSecurePassword(){
    isPasswordSecure=isPasswordSecure==true?false:true;
    update();
  }
  goToSignUp() {
    Get.offAllNamed(RoutesConst.register);
  }

  goToForget() {
    Get.toNamed(RoutesConst.forgetPassword);

  }
}