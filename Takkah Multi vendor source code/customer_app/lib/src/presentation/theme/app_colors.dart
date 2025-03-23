import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/utils.dart';

class AppColors {
  AppColors._();

  static const Color red = Color(0xFFDD2339);
  static const Color blue = Color(0xFF3569B8);
  static const Color blueBonus = Color(0xFF0D5FFF);
  static const Color gray = Color(0xFF88887E);
  static const Color black = Color(0xFF000000);
  static const Color lightBlack = Color(0xFF232B2F);
  static const Color green = Color(0xFF45A524);
  static const Color white = Color(0xFFFFFFFF);
  static const Color unrated = Color(0xFFE3E1E7);
  static const Color warning = Color(0xFFFFA100);
  static Color shimmerBase = Colors.grey.shade300;
  static const Color darkBlue = Color(0xFF25303F);
  static const Color darkGreen = Color(0xFF367E1C);
  static const Color transparent = Color(0x00000000);
  static const Color textGrey = Color(0xFF898989);
  static const Color unratedDark = Color(0xFF828B96);
  static const Color bgGrey = Color(0xFFF4F5F8);
  static const Color buttonShadow = Color(0xA6A6A640);
  static const Color warningLight = Color(0xFFF3D56B);
  static Color shimmerHighlight = Colors.grey.shade100;
  static const Color iconBackLight = Color(0xFFF8F8F8);
  static const Color showDetailButton = Color(0xFF57727C);
  static const Color recipeItemShadow = Color(0xDFE2EBC9);
  static const Color profileCompleted = Color(0xFFFFB800);
  static const Color shimmerBaseDark = Color.fromRGBO(117, 117, 117, 0.29);
  static const Color shimmerHighlightDark = Color.fromRGBO(194, 194, 194, 0.65);

  static Color mainShimmerHighlight({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode())
          ? shimmerHighlightDark
          : shimmerHighlight;

  static Color mainShimmerBase({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode())
          ? shimmerBaseDark
          : shimmerBase;

  static Color mainBackground({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode())
          ? const Color(0xFF131415)
          : const Color(0xFFF3F3F0);

  static Color mainAppbarBack({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode())
          ? darkBlue
          : white;

  static Color mainAppbarShadow({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode())
          ? const Color.fromRGBO(23, 27, 32, 0.13)
          : const Color.fromRGBO(169, 169, 150, 0.13);

  static Color iconAndTextColor({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode()) ? white : black;

  static Color secondaryBack({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode())
          ? const Color(0xFF1A222C)
          : const Color(0xFFF9F9F6);

  static Color secondaryIconTextColor({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode())
          ? unratedDark
          : gray;

  static Color onBoardingDot({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode())
          ? darkBlue
          : const Color(0xFFE9E9E6);

  static Color myLocationButtonBack({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode())
          ? darkBlue
          : white;

  static Color imageNotFound({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode()) ? white : black;

  static Color unratedIcon({bool? isDarkMode}) =>
      (isDarkMode ?? LocalStorage.instance.getAppThemeMode())
          ? unratedDark
          : unrated;
}

class AppStyle{
  static interNoSemi({
    double size = 18,
    Color color = AppColors.lightBlack,
    TextDecoration decoration =  TextDecoration.none,
    double letterSpacing = 0}) =>
      GoogleFonts.inter(
          fontSize: size.sp,
          fontWeight: FontWeight.w600,
          color: color,
          letterSpacing: letterSpacing.sp,
          decoration: decoration);
}
