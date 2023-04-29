import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:paytac/core/constant/colors.dart';
import 'package:paytac/core/constant/dimensions.dart';
import 'package:paytac/widgets/auth/custom_body_text_auth.dart';
import 'package:paytac/widgets/auth/custom_title_text_auth.dart';
import 'package:paytac/widgets/auth/logo_auth.dart';


class VerifyRegisterCodeScreen extends StatelessWidget {
  const VerifyRegisterCodeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // VerifyCodeControllerImp controller =
     // Get.put(VerifyCodeRegisterControllerImp());
    //final controller = Get.find<VerifyCodeRegisterControllerImp>();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.grey),
          title: Text(
            "Verify Code",
            style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.font23),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body:  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.width10,
                          horizontal: Dimensions.height25),
                      child: ListView(
                        children: [
                          const LogoAuth(),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          const CustomTitleTextAuth(text: "Check Email"),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          const CustomBodyTextAuth(
                            text:
                                "Sign In with Your Email and Password or continue with Social Media",
                          ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                          OtpTextField(
                            fieldWidth: Dimensions.width120,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            numberOfFields: 5,
                            borderColor: const Color(0xFF512DA8),
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                              // controller.verifyCode=code;
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                             // controller.goToHomePage(verificationCode);
                              // showDialog(
                              //     context: context,
                              //     builder: (context){
                              //       return AlertDialog(
                              //         title: Text("Verification Code"),
                              //         content: Text('Code entered is $verificationCode'),
                              //       );
                              //     }
                              // );
                            }, // end onSubmit
                          ),

                        ],
                      ),
                    ),
        );
  }
}
