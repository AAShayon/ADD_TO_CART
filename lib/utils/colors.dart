import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors{

  static const Color primaryColor=Color(0xffFF6B23);
  static const Color  secondaryColor=Color(0xffFF9727);
  static const Color baseColorOffWhite=Color(0xffF7F8F9);
  static const Color baseColorOffWhiteShade=Color(0xff686868);
  static const Color baseColorWhite=Color(0xffffffff);
  static const Color baseColorBlack=Color(0xff010832);
  static const Color baseColorLightOrange=Color(0xffFFF1E9);
  static const LinearGradient linearGradient=LinearGradient(colors: [
    Color(0xffFF6B23),Color(0xffFF9727),],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}