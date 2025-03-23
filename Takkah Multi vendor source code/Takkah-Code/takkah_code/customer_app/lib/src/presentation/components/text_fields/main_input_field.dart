import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class MainInputField extends StatelessWidget {
  final String title;
  final String? hintText;
  final ValueSetter<String> onChange;
  final VoidCallback? onEditingComplete;
  final TextInputType? inputType;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool? obscure;
  final String? initialText;
  final TextEditingController? textController;
  final bool isError;
  final String? descriptionText;
  final bool isSuccess;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final TextInputAction? inputAction;

  const MainInputField({
    Key? key,
    required this.title,
    required this.onChange,
    this.onEditingComplete,
    this.hintText,
    this.inputType,
    this.readOnly = false,
    this.suffixIcon,
    this.obscure,
    this.initialText,
    this.prefix,
    this.textController,
    this.isError = false,
    this.descriptionText,
    this.isSuccess = false,
    this.validator,
    this.textCapitalization,
    this.inputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        24.verticalSpace,
        Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            letterSpacing: -0.4,
            color: AppColors.iconAndTextColor().withOpacity(0.3),
          ),
        ),
        TextFormField(
          onEditingComplete: onEditingComplete,
          cursorColor: AppColors.iconAndTextColor(),
          cursorWidth: 1.r,
          onChanged: onChange,
          keyboardType: inputType,
          readOnly: readOnly,
          obscureText: !(obscure ?? true),
          obscuringCharacter: '*',
          initialValue: initialText,
          controller: textController,
          validator: validator,
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          textInputAction: inputAction,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            letterSpacing: -0.4,
            color: AppColors.iconAndTextColor(),
          ),
          decoration: InputDecoration(
            prefix: prefix,
            suffixIcon: suffixIcon,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.iconAndTextColor(),
                width: 1.r,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.secondaryIconTextColor(),
                width: 1.r,
              ),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              letterSpacing: -0.4,
              color: AppColors.secondaryIconTextColor(),
            ),
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
                      : (isSuccess
                          ? AppColors.green
                          : AppColors.iconAndTextColor()),
                ),
              ),
            ],
          )
      ],
    );
  }
}
