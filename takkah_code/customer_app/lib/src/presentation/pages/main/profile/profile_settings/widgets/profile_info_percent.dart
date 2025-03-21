import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';

class ProfileInfoPercent extends StatelessWidget {
  const ProfileInfoPercent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.profileCompleted,
      ),
      alignment: AlignmentDirectional.centerStart,
      padding: REdgeInsets.symmetric(horizontal: 19),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text:
              '${AppHelpers.getTranslation(TrKeys.completed)} — ',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                letterSpacing: -0.4,
                color: AppColors.white,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                  '${AppHelpers.getProfileInfoPercentage()}%',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                    letterSpacing: -0.4,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          5.verticalSpace,
          Row(
            children: <Widget>[
              ProfileDot(
                isFull:
                AppHelpers.getProfileInfoPercentage() >
                    13,
                width: 16,
                height: 6,
                radius: 12,
                fillColor: AppColors.white,
                notFillColor:
                AppColors.gray.withOpacity(0.21),
              ),
              2.horizontalSpace,
              ProfileDot(
                isFull:
                AppHelpers.getProfileInfoPercentage() >
                    27,
                width: 16,
                height: 6,
                radius: 12,
                fillColor: AppColors.white,
                notFillColor:
                AppColors.gray.withOpacity(0.21),
              ),
              2.horizontalSpace,
              ProfileDot(
                isFull:
                AppHelpers.getProfileInfoPercentage() >
                    41,
                width: 16,
                height: 6,
                radius: 12,
                fillColor: AppColors.white,
                notFillColor:
                AppColors.gray.withOpacity(0.21),
              ),
              2.horizontalSpace,
              ProfileDot(
                isFull:
                AppHelpers.getProfileInfoPercentage() >
                    55,
                width: 16,
                height: 6,
                radius: 12,
                fillColor: AppColors.white,
                notFillColor:
                AppColors.gray.withOpacity(0.21),
              ),
              2.horizontalSpace,
              ProfileDot(
                isFull:
                AppHelpers.getProfileInfoPercentage() >
                    69,
                width: 16,
                height: 6,
                radius: 12,
                fillColor: AppColors.white,
                notFillColor:
                AppColors.gray.withOpacity(0.21),
              ),
              2.horizontalSpace,
              ProfileDot(
                isFull:
                AppHelpers.getProfileInfoPercentage() >
                    83,
                width: 16,
                height: 6,
                radius: 12,
                fillColor: AppColors.white,
                notFillColor:
                AppColors.gray.withOpacity(0.21),
              ),
              2.horizontalSpace,
              ProfileDot(
                isFull:
                AppHelpers.getProfileInfoPercentage() >
                    98,
                width: 16,
                height: 6,
                radius: 12,
                fillColor: AppColors.white,
                notFillColor: AppColors.warningLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
