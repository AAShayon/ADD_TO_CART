import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors{

  static const Color primaryColor=Color(0xffFF6B23);
  static const Color  secondaryColor=Color(0xffFF9727);
  static const Color baseColorOffWhite=Color(0xffF7F8F9);
  static const Color baseColorLightOrange=Color(0xffFFF1E9);
  static const LinearGradient linearGradient=LinearGradient(colors: [
    Color(0xffFF6B23),Color(0xffFF9727),],
    stops: [0.9, 0.9],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}