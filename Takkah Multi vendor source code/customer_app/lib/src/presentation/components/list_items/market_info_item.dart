import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class MarketInfoItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String title;
  final bool isLast;

  const MarketInfoItem({
    Key? key,
    required this.iconData,
    required this.label,
    required this.title,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.r,
          height: 40.r,
          margin: EdgeInsetsDirectional.only(end: 15.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secondaryBack(),
          ),
          alignment: Alignment.center,
          child: Icon(
            iconData,
            size: 20.r,
            color: AppColors.iconAndTextColor(),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: AppColors.secondaryIconTextColor(),
                  letterSpacing: -0.4,
                ),
              ),
              8.verticalSpace,
              Text(
                title,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.iconAndTextColor(),
                  letterSpacing: -0.4,
                ),
              ),
              22.verticalSpace,
             if(!isLast) Divider(
                height: 1.r,
                thickness: 1.r,
                color: AppColors.gray.withOpacity(0.2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
