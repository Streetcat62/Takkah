import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class CommonInputField extends StatelessWidget {
  final String label;
  final Widget? suffixIcon;
  final bool? obscure;
  final TextEditingController? textController;
  final ValueSetter<String>? onChanged;
  final TextInputType? inputType;
  final String? initialText;
  final String? descriptionText;
  final bool readOnly;
  final bool isError;
  final bool isSuccess;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final String? hintText;

  const CommonInputField({
    Key? key,
    required this.label,
    this.suffixIcon,
    this.obscure,
    this.onChanged,
    this.textController,
    this.inputType,
    this.initialText,
    this.descriptionText,
    this.readOnly = false,
    this.isError = false,
    this.isSuccess = false,
    this.textCapitalization,
    this.textInputAction,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: AppColors.iconAndTextColor(),
          ),
        ),
        if (suffixIcon != null) 4.verticalSpace,
        TextFormField(
          onChanged: onChanged,
          obscureText: !(obscure ?? true),
          obscuringCharacter: '*',
          controller: textController,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: AppColors.iconAndTextColor(),
          ),
          cursorWidth: 1,
          cursorColor: AppColors.iconAndTextColor(),
          keyboardType: inputType,
          initialValue: initialText,
          readOnly: readOnly,
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: AppColors.gray.withOpacity(0.26),
            ),
            contentPadding: EdgeInsets.zero,
            fillColor: AppColors.transparent,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            border: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
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
                      ? AppColors.red
                      : isSuccess
                          ? AppColors.green
                          : AppColors.black,
                ),
              ),
            ],
          )
      ],
    );
  }
}
