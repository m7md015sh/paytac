import 'package:flutter/material.dart';
import 'package:paytac/core/constant/colors.dart';
import 'package:paytac/core/constant/dimensions.dart';


class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String text;
  final String textBtn;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn({Key? key,required this.text,required this.textBtn,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
         Text(text, style: TextStyle(
           fontFamily: 'Cairo',
           fontSize: Dimensions.font16,
           fontWeight: FontWeight.bold,
           color: AppColors.grey,
         ),),
        InkWell(
          onTap: onTap,
          child: Text(textBtn,style: TextStyle(color: AppColors.mainColor,fontWeight: FontWeight.bold,fontSize: Dimensions.font16,fontFamily: 'Cairo'),),
        )
      ],
    );
  }
}
