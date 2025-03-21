import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  Style._();

  /// ###################### Colors ##########################
  static const white = Colors.white;
  static const redColor = Color(0xffFF3D00);
  static const blueColor = Color(0xff03758E);
  static const textColor = Color(0xff898989);
  static const iconColor = Color(0xffC4C4C4);
  static const greyColor = Color(0xffF4F5F8);
  static const greenColor = Color(0xff16AA16);
  static const bgRedColor = Color(0xffFFF2EE);
  static const iconsColor = Color(0xff232B2F);
  static const blackColor = Color(0xff000000);
  static const orangeColor = Color(0xffF19204);
  static const shimmerBase = Color(0xFFE0E0E0);
  static const toggleColor = Color(0xFFE7E7E7);
  static const borderColor = Color(0xFFF2F2F2);
  static const shadowColor = Color(0xFF7D7D7D);
  static const transparent = Colors.transparent;
  static const primaryColor = Color(0xFF45A524);
  static const logOutBgColor = Color(0xFFB9B9B9);
  static const addCountColor = Color(0xFFF7F7F7);
  static const progressColor = Color(0xffF26110);
  static const discountColor = Color(0xFFF3F3F3);
  static const shimmerHighlight = Color(0xFFF5F5F5);
  static const blackColorOpacity = Color(0x06000000);
  static const toggleShadowColor = Color(0xFF6B6B6B);
  static const tabBarBorderColor = Color(0xFFDEDFE1);
  static const bottomSheetIconColor = Color(0xffC4C5C7);
  static const bottomNavigationBarColor = Color(0xff191919);

  /// @@@@@@@@@@@@@@@@@ Fonts @@@@@@@@@@@@@@@@@@@@@@@@

  static interBold({
    double size = 18,
    Color color = Style.blackColor,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        decoration: TextDecoration.none,
        letterSpacing: letterSpacing,
      );

  static interSemi({
    double size = 18,
    Color color = Style.blackColor,
    TextDecoration decoration = TextDecoration.none,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static interNormal({
    double size = 16,
    Color color = Style.blackColor,
    double letterSpacing = 0,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
      );

  static interRegular({
    double size = 16,
    Color color = Style.blackColor,
    double letterSpacing = 0,
    TextDecoration textDecoration = TextDecoration.none,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        fontStyle: fontStyle,
      );
}
