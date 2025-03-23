import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import 'buttons_bouncing_effect.dart';

class CustomButton extends StatelessWidget {
  final Widget? icon;
  final String title;
  final bool isLoading;
  final VoidCallback? onPressed;
  final Color background;
  final Color borderColor;
  final Color textColor;
  final double width;
  final double radius;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.background = Style.primaryColor,
    this.textColor = Style.white,
    this.width = double.infinity,
    this.radius = 10,
    this.icon,
    this.borderColor = Style.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsBouncingEffect(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: 48.sp,
          decoration: BoxDecoration(
            color: background,
            border: Border.all(
              color:
                  borderColor == Style.transparent ? background : borderColor,
              width: 2.r,
            ),
            borderRadius: BorderRadius.circular(radius.r),
          ),
          alignment: Alignment.center,
          child: isLoading
              ? Center(
                  child: SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.r,
                      color: Style.white,
                    ),
                  ),
                )
              : (icon == null
                  ? Text(
                      title,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: textColor,
                        letterSpacing: -14 * 0.01,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon!,
                        16.horizontalSpace,
                        Text(
                          title,
                          style:
                              Style.interNormal(size: 16.sp, color: textColor),
                        ),
                      ],
                    )),
        ),
      ),
    );
  }
}
