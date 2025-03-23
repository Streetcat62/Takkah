import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class SelectDateButton extends StatelessWidget {
  final String label;
  final String? time;
  final VoidCallback onChangeTap;
  final String? hintText;
  final IconData? iconData;

  const SelectDateButton({
    Key? key,
    this.time,
    this.hintText,
    this.iconData,
    required this.label,
    required this.onChangeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.r,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconData ?? FlutterRemix.calendar_event_fill,
                size: 18.r,
                color: AppColors.iconAndTextColor(),
              ),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.secondaryIconTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                  3.verticalSpace,
                  Text(
                    time ??
                        (hintText ??
                            AppHelpers.getTranslation(
                                TrKeys.selectDeliveryTime)),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Material(
            borderRadius: BorderRadius.circular(100.r),
            color: AppColors.iconAndTextColor(),
            child: InkWell(
              borderRadius: BorderRadius.circular(100.r),
              onTap: onChangeTap,
              child: Container(
                height: 30.r,
                padding: REdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Text(
                  AppHelpers.getTranslation(TrKeys.change),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.mainAppbarBack(),
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
