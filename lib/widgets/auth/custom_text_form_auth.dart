import 'package:flutter/material.dart';
import 'package:paytac/core/constant/colors.dart';
import 'package:paytac/core/constant/dimensions.dart';


class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isNumber;
  final void Function()?onTapSuffixIcon;
  final bool? obscure;
  final IconData? suffixIcon;
  final IconData prefixIcon;
  final TextEditingController? myController;
  final String? Function(String?) valid;

  const CustomTextFormAuth(
      {Key? key,
        required this.valid,
      required this.hintText,
      required this.labelText,
       this.suffixIcon,
      required this.prefixIcon,
       this.myController,
        required this.isNumber,
        this.obscure,
        this.onTapSuffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height20),
      child: TextFormField(
        keyboardType:isNumber==true? const TextInputType.numberWithOptions(decimal: true):TextInputType.text,
        validator: valid,
        controller: myController,
        obscureText: obscure==null ||obscure==false ?false:true,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Cairo',
              color: AppColors.grey,
              fontSize: Dimensions.font16,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(
                vertical: Dimensions.height5, horizontal: Dimensions.width40),
            label: Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                child:  Text(labelText,style: TextStyle(fontFamily: 'Cairo',fontSize: Dimensions.font12),)),
            suffixIcon: InkWell(onTap:onTapSuffixIcon ,child: Icon(suffixIcon)),
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius30))),
      ),
    );
  }
}
