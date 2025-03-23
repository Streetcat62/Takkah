import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../core/constants/constants.dart';

class OrderStatusItem extends StatelessWidget {
  final String text;
  final IconData iconData;
  final OrderItemWidgetStatus status;

  const OrderStatusItem({
    Key? key,
    required this.status,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 36.r,
            height: 36.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: status == OrderItemWidgetStatus.canceled
                  ? AppColors.red
                  : (status == OrderItemWidgetStatus.completed
                      ? AppColors.green
                      : (status == OrderItemWidgetStatus.current
                          ? AppColors.profileCompleted
                          : AppColors.unratedIcon())),
            ),
            alignment: Alignment.center,
            child: Icon(
              iconData,
              size: 16.r,
              color: status == OrderItemWidgetStatus.notYet
                  ? AppColors.secondaryIconTextColor()
                  : AppColors.mainAppbarBack(),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Container(
              height: 52.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: status == OrderItemWidgetStatus.canceled
                    ? AppColors.red
                    : (status == OrderItemWidgetStatus.completed
                        ? AppColors.green
                        : (status == OrderItemWidgetStatus.current
                            ? AppColors.profileCompleted
                            : AppColors.unratedIcon())),
              ),
              padding: REdgeInsets.symmetric(horizontal: 16),
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: status == OrderItemWidgetStatus.notYet
                      ? AppColors.secondaryIconTextColor()
                      : AppColors.mainAppbarBack(),
                  letterSpacing: -0.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
