import 'package:flutter/material.dart';
import 'package:paytac/core/constant/colors.dart';
TextStyle headingStyle = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
    fontFamily: 'Cairo'
);
TextStyle contentStyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: 'Cairo'
);
LinearGradient gradientStyle = LinearGradient(
    colors: [AppColors.mainColor,AppColors.mainDarkColor],
    stops: const [0,1],
    begin: Alignment.topCenter
);