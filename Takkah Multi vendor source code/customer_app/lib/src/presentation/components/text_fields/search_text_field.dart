import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class SearchTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final ValueSetter<String>? onChanged;
  final Color? backgroundColor;

  const SearchTextField({
    Key? key,
    this.hintText,
    this.suffixIcon,
    this.textEditingController,
    this.onChanged,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: AppColors.iconAndTextColor(),
        letterSpacing: -0.5,
      ),
      onChanged: onChanged,
      controller: textEditingController,
      cursorColor: AppColors.iconAndTextColor(),
      cursorWidth: 1,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: AppColors.secondaryIconTextColor(),
          letterSpacing: -0.5,
        ),
        hintText: hintText ?? AppHelpers.getTranslation(TrKeys.searchProducts),
        contentPadding: REdgeInsets.symmetric(horizontal: 15, vertical: 17),
        prefixIcon: Icon(
          FlutterRemix.search_2_line,
          size: 20.r,
          color: AppColors.iconAndTextColor(),
        ),
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? AppColors.secondaryBack(),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: backgroundColor ?? AppColors.secondaryBack(),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: backgroundColor ?? AppColors.secondaryBack(),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: backgroundColor ?? AppColors.secondaryBack(),
          ),
        ),
      ),
    );
  }
}
