import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/constants/constants.dart';

class OrderDatesWidget extends StatelessWidget {
  final OrderData? orderData;

  const OrderDatesWidget({Key? key, this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.r,
      margin: REdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.iconAndTextColor(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.datePurchased),
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.secondaryIconTextColor(),
                  letterSpacing: -0.4,
                ),
              ),
              4.verticalSpace,
              Text(
                '${orderData?.createdAt?.substring(0, 10)}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.mainAppbarBack(),
                  letterSpacing: -0.4,
                ),
              ),
            ],
          ),
          Container(
            width: 1.r,
            height: 50.r,
            color: AppColors.mainAppbarBack().withOpacity(0.64),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.deliveryDate),
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.secondaryIconTextColor(),
                  letterSpacing: -0.4,
                ),
              ),
              4.verticalSpace,
              Text(
                '${orderData?.deliveryDate}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.mainAppbarBack(),
                  letterSpacing: -0.4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
