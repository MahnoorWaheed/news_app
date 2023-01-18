import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  static const lightBlue = Color(0xFF3589F7);
  static const darkBlue = Color(0xFF101829);
  static const lightgrey = Color(0x4B2E2E30);

 static const containerGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xffFFB5D1), Color(0xffF8DAD1)
  ],
  );

}