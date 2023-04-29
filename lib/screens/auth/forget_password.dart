import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:paytac/core/constant/assets_image.dart';
import 'package:paytac/core/constant/colors.dart';
import 'package:paytac/core/constant/dimensions.dart';
import 'package:paytac/core/functions/valied_input.dart';
import 'package:paytac/widgets/auth/custom_body_text_auth.dart';
import 'package:paytac/widgets/auth/custom_button_auth.dart';
import 'package:paytac/widgets/auth/custom_text_form_auth.dart';
import 'package:paytac/widgets/auth/custom_title_text_auth.dart';
import 'package:paytac/widgets/auth/logo_auth.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

   // final controller=Get.find<CheckEmailController>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.titleColor),
        title: Text(
          "Forget Password",
          style: TextStyle(
              color: AppColors.titleColor,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.font23),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.width10, horizontal: Dimensions.height25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(AppImageAsset.forgotPasswordLottie,width: 200,height: 200,),
              SizedBox(
                height: Dimensions.height20,
              ),
              const CustomTitleTextAuth(text: "Check Email"),
              SizedBox(
                height: Dimensions.height20,
              ),
              const CustomBodyTextAuth(
                text:
                    "Please Enter your Email Address To Receive A Verification Code",
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Form(
               // key: controller.checkEmailFormKey,

                child: CustomTextFormAuth(
                  isNumber: false,

                  valid: (val){
                    return validInput(val!, 12 , 60, "email");
                  },
                  //myController: controller.emailController,
                  hintText: "Enter Your Email",
                  labelText: "Email",
                  prefixIcon: Icons.email_outlined,
                ),
              ),
              CustomButtonAuth(
                text: "Check Email",
                onPressed: () {
                  //controller.checkEmailResetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
