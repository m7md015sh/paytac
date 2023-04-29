import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors{
  static final Color textColor = const Color(0xFFccc7c5);
  static final Color mainColor = const Color(0xFF89dad0);
  static final Color mainDarkColor = const Color(0xff088f7e);
  static final Color navyBlueColor = const Color(0xff090f62);

  //static final Color mainColor = const Color(0xFFfa7552);
  static final Color iconColor1 = const Color(0xFFffd28d);
  static final Color iconColor2 = const Color(0xFFfcab88);
  static final Color paraColor = const Color(0xFF8f837f);
  static final Color grey = const Color(0xffababab);
  static final Color buttonBackgroundColor= const Color(0xFFf7f6f4);
  static final Color signColor = const Color(0xFFa9a29f);
  static final Color titleColor = const Color(0xFF5c524f);
  static final Color mainBlackColor = const Color(0xFF332d2b);
  //static final Color yellowColor = const Color(0xFFfa7552);
  static final Color yellowColor = const Color(0xFFffd379);

  //card

static List<BoxShadow>shadows=[
  BoxShadow(
    color: Colors.white.withOpacity(0.2),
    spreadRadius: -5,
    offset: const Offset(-5,-5),
   // blurRadius: 0,
  ),
  BoxShadow(
    color: Colors.green.shade900.withOpacity(0.7),
    spreadRadius: -5,
    offset: const Offset(7,7),
   // blurRadius: 0,
  )
];

}