import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';

class OrderDetailsHeader extends StatelessWidget {
  const OrderDetailsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 196.r,
      color: AppColors.transparent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 88.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r),
              ),
              color: AppColors.mainAppbarBack(),
            ),
            padding: REdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleIconButton(
                  onTap: () {},
                  iconData: FlutterRemix.message_3_fill,
                  width: 50,
                  iconColor: AppColors.iconAndTextColor(),
                  backgroundColor: AppColors.mainBackground(),
                ),
                CircleIconButton(
                  onTap: () {},
                  iconData: FlutterRemix.phone_fill,
                  width: 50,
                  iconColor: AppColors.iconAndTextColor(),
                  backgroundColor: AppColors.mainBackground(),
                ),
              ],
            ),
          ),
          Container(
            width: 176.r,
            height: 176.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mainAppbarBack(),
            ),
            padding: REdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 106.r,
                  height: 106.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainAppbarBack(),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 25.r,
                        spreadRadius: 0,
                        color: AppColors.profileCompleted
                            .withOpacity(0.24),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '01:23',
                        style: GoogleFonts.inter(
                          color: AppColors.iconAndTextColor(),
                          fontSize: 22.sp,
                          letterSpacing: -0.4,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        AppHelpers.getTranslation(TrKeys.nextStep),
                        style: GoogleFonts.inter(
                          color: AppColors.secondaryIconTextColor(),
                          fontSize: 12.sp,
                          letterSpacing: -0.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 176.r,
                  height: 176.r,
                  child: CircularProgressIndicator(
                    value: 0.6,
                    strokeWidth: 18.r,
                    color: AppColors.profileCompleted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
