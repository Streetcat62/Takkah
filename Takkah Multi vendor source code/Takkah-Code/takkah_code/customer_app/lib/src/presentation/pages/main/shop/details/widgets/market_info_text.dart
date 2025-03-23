import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';

class MarketInfoText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onTap;

  const MarketInfoText({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            iconData,
            size: 16.r,
            color: AppColors.secondaryIconTextColor(),
          ),
          6.horizontalSpace,
          Text(
            text,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.secondaryIconTextColor(),
              letterSpacing: -1,
            ),
          ),
        ],
      ),
    );
  }
}
