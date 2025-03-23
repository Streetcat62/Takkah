import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../components/components.dart';

class NotificationItem extends StatelessWidget {
  final BlogData notification;

  const NotificationItem({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainAppbarBack(),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: REdgeInsets.all(16),
      margin: REdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${notification.translation?.title}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: AppColors.iconAndTextColor(),
                  letterSpacing: -0.4,
                ),
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text(
                    '${notification.createdAt?.substring(0, 10)}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.secondaryIconTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                  8.horizontalSpace,
                  const SmallDot(),
                  8.horizontalSpace,
                  Text(
                    '${notification.createdAt?.substring(11, 16)}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.secondaryIconTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            FlutterRemix.arrow_right_s_line,
            size: 20.r,
            color: AppColors.iconAndTextColor(),
          ),
        ],
      ),
    );
  }
}
