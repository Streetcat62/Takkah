import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import '../../../../../models/models.dart';
import '../../../../components/components.dart';

class NewLanguageItemWidget extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onPress;
  final LanguageData language;

  const NewLanguageItemWidget({
    Key? key,
    required this.language,
    required this.onPress,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsBouncingEffect(
      child: GestureDetector(
        onTap: onPress,
        child: Padding(
          padding: REdgeInsets.only(bottom: 8),
          child: Container(
            width: 1.sw - 30,
            height: 60.r,
            padding: REdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppColors.mainAppbarShadow(),
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: 0,
                )
              ],
              color: AppColors.mainAppbarBack(),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: <Widget>[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, anim) => RotationTransition(
                    turns: child.key == const ValueKey('icon1')
                        ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                        : Tween<double>(begin: 0.75, end: 1).animate(anim),
                    child: ScaleTransition(scale: anim, child: child),
                  ),
                  child: Icon(
                    isChecked
                        ? FlutterRemix.checkbox_circle_fill
                        : FlutterRemix.checkbox_blank_circle_line,
                    size: 24.sp,
                    color: isChecked
                        ? AppColors.green
                        : AppColors.iconAndTextColor(),
                  ),
                ),
                Container(
                  height: 15.r,
                  width: 20.r,
                  margin: REdgeInsets.only(left: 20, right: 8),
                  child: CommonImage(
                    imageUrl: language.img,
                    height: 15,
                    width: 20,
                    radius: 0,
                  ),
                ),
                Text(
                  '${language.title}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    letterSpacing: -0.5,
                    color: AppColors.iconAndTextColor(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
