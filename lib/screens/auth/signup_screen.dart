import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paytac/controllers/auth/signup_controller.dart';
import 'package:paytac/core/constant/dimensions.dart';
import 'package:paytac/core/constant/routes_const.dart';


import '../../../core/constant/assets_image.dart';
import '../../../core/functions/alert_exit.dart';
import '../../../core/functions/valied_input.dart';
import '../../widgets/auth/custom_body_text_auth.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_form_auth.dart';
import '../../widgets/auth/custom_text_login_or_signup.dart';
import '../../widgets/auth/custom_title_text_auth.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   Get.lazyPut(()=>SignUpControllerImp());
     final  controller  =Get.find<SignupController>();
    return Scaffold(
        body: GetBuilder<SignupController>(builder: (controller) => controller.isLoading?Center(child: Lottie.asset(AppImageAsset.loadingLottie,width: 200,height: 200,)): WillPopScope(
                onWillPop: alertExitApp,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height30,
                      horizontal: Dimensions.height25),
                  child: Form(
                    key: controller.signupFormKey,
                    child: ListView(
                      children: [
                        const CustomTitleTextAuth(text: "Sign Up"),
                        SizedBox(
                          height: Dimensions.height35,
                        ),
                        const CustomBodyTextAuth(
                          text:
                          "Sign Up with Your Email and Password",
                        ),
                        SizedBox(
                          height: Dimensions.height60,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 80, "name");
                          },
                          myController: controller.firstNameController,
                          hintText: "Enter Your First Name",
                          labelText: "First Name",
                          prefixIcon: Icons.person,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 80, "name");
                          },
                          myController: controller.lastNameController,
                          hintText: "Enter Your Last Name",
                          labelText: "Last Name",
                          prefixIcon: Icons.person,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 12, 30, "email");
                          },
                          myController: controller.emailController,
                          hintText: "Enter Your Email",
                          labelText: "Email",
                          prefixIcon: Icons.email_outlined,
                        ),
                        CustomTextFormAuth(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 11, 11, "phone");
                          },
                          myController: controller.phoneController,
                          hintText: "Your Phone Number",
                          labelText: "Phone",
                          prefixIcon: Icons.phone,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 8, 30, "password");
                          },
                          obscure: controller.isPasswordSecure,
                          onTapSuffixIcon: () {
                            controller.changeSecurePassword();
                          },
                          myController: controller.passwordController,
                          hintText: "Enter Your Password",
                          labelText: "Password",
                          prefixIcon: Icons.lock_outline,
                          suffixIcon:
                          controller.isPasswordSecure == true
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye_rounded,
                        ),
                        CustomButtonAuth(
                                text: "Sign Up",
                                onPressed: () {
                                  controller.doSignup();
                                },
                              ),

                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        CustomTextSignUpOrSignIn(
                            text: "Your have an account?",
                            textBtn: "  Sign In",
                            onTap: () {
                             controller.goToLogin();
                            })
                      ],
                    ),
                  ),
                ))));
  }
}
