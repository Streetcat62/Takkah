import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';
import '../../../../../../components/components.dart';

class CurrencyItemWidget extends StatelessWidget {
  final bool isChecked;
  final String? text;
  final VoidCallback? onPress;

  const CurrencyItemWidget({
    Key? key,
    required this.isChecked,
    this.text,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.mainAppbarBack(),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: onPress,
            child: Container(
              height: 60.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  CustomCheckBox(isChecked: isChecked),
                  16.horizontalSpace,
                  Text(
                    '$text',
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
        8.verticalSpace,
      ],
    );
  }
}
