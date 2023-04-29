import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paytac/core/constant/routes_const.dart';
import 'package:paytac/data/services/auth_service.dart';

class SignupController extends GetxController {
  final signupFormKey = GlobalKey<FormState>();
  late TextEditingController firstNameController,
      lastNameController,
      emailController,
      phoneController,
      passwordController;
  var isLoading = false;

  @override
  void onInit() {
    //signUp();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  doSignup() async {
    bool isValidate = signupFormKey.currentState!.validate();
    if (isValidate) {
      isLoading = true;
      update();
      try {
        var data = await AuthServices.signup(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            phone: phoneController.text,
            password: passwordController.text);
        if (data != null) {
          // await storage.write(key: "name",value: data.user.name);
          // await storage.write(key: "token",value: data.token);
          //loginFormKey.currentState!.save();
          //loginFormKey.currentState!.save();
          Get.snackbar('Account created successfully', 'You can now log in');
          await Get.offNamed(RoutesConst.login);

          update();
        } else {
          print(data);
          Get.snackbar('Signup', 'you have something error in signup');
          update();
        }
      } finally {
        isLoading = false;
        update();
      }
    }
  }

  bool isPasswordSecure = true;
  void changeSecurePassword() {
    isPasswordSecure = isPasswordSecure == true ? false : true;
    update();
  }

  goToLogin() {
    Get.offAllNamed(RoutesConst.login);
  }

  goToForget() {
    Get.toNamed(RoutesConst.forgetPassword);
  }
}
