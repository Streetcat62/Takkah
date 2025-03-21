import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../models/models.dart';

class CheckoutPaymentItem extends StatelessWidget {
  final PaymentData payment;
  final VoidCallback onTap;
  final bool isSelected;

  const CheckoutPaymentItem({
    Key? key,
    required this.payment,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15.r),
            onTap: onTap,
            child: Container(
              height: 60.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: isSelected
                      ? AppColors.iconAndTextColor()
                      : AppColors.unratedIcon(),
                  width: 1.r,
                ),
              ),
              alignment: Alignment.center,
              padding: REdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    isSelected
                        ? FlutterRemix.radio_button_fill
                        : FlutterRemix.checkbox_blank_circle_line,
                    size: 24.r,
                    color: isSelected
                        ? AppColors.profileCompleted
                        : AppColors.secondaryIconTextColor(),
                  ),
                  14.horizontalSpace,
                  Text(
                    '${payment.payment?.translation?.title}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        15.verticalSpace,
      ],
    );
  }
}
