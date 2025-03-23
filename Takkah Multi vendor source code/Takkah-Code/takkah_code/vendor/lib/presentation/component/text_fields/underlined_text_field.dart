import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../../infrastructure/services/services.dart';

class UnderlinedTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final Widget? suffixIcon;
  final bool? obscure;
  final bool isWarning;
  final TextEditingController? textController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final TextInputType? inputType;
  final String? initialText;
  final String? descriptionText;
  final bool readOnly;
  final bool isError;
  final bool isSuccess;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  const UnderlinedTextField({
    Key? key,
    required this.label,
    this.suffixIcon,
    this.obscure,
    this.onChanged,
    this.onEditingComplete,
    this.textController,
    this.inputType,
    this.initialText,
    this.descriptionText,
    this.readOnly = false,
    this.isError = false,
    this.isSuccess = false,
    this.textCapitalization,
    this.textInputAction,
    this.hint,
    this.onTap,
    this.validator,
    this.isWarning = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onEditingComplete: onEditingComplete,
          onTap: onTap,
          onChanged: onChanged,
          obscureText: !(obscure ?? true),
          obscuringCharacter: '*',
          controller: textController,
          style: Style.interNormal(
            size: 15.sp,
            color: isDarkMode ? Style.white : Style.blackColor,
          ),
          cursorWidth: 1,
          cursorColor: isDarkMode ? Style.white : Style.blackColor,
          keyboardType: inputType,
          initialValue: initialText,
          readOnly: readOnly,
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          textInputAction: textInputAction,
          validator: validator,
          decoration: InputDecoration(
            suffixIconConstraints: BoxConstraints(
              maxHeight: suffixIcon != null ? 80.h : 30.h,
              maxWidth: suffixIcon != null ? 80.w : 30.w,
            ),
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: isDarkMode ? Style.white : Style.textColor,
            ),
            labelText: label.toUpperCase(),
            labelStyle: Style.interNormal(
              size: 14.sp,
              color: isWarning ? Style.redColor : Style.blackColor,
            ),
            contentPadding: REdgeInsets.symmetric(horizontal: 0, vertical: 8),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Style.shimmerBase),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Style.redColor),
            ),
            border: const UnderlineInputBorder(),
            focusedErrorBorder: const UnderlineInputBorder(),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Style.shimmerBase),
            ),
            focusedBorder: const UnderlineInputBorder(),
          ),
        ),
        if (descriptionText != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              4.verticalSpace,
              Text(
                descriptionText!,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.3,
                  fontSize: 12.sp,
                  color: isError
                      ? Style.redColor
                      : isSuccess
                          ? Style.textColor
                          : Style.blackColor,
                ),
              ),
            ],
          )
      ],
    );
  }
}
