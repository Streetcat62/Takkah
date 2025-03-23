import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/constants/constants.dart';

class DeliveryTypeItem extends StatelessWidget {
  final ShopDelivery delivery;
  final bool isSelected;
  final VoidCallback onTap;

  const DeliveryTypeItem({
    Key? key,
    required this.delivery,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          18.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    isSelected
                        ? FlutterRemix.checkbox_circle_fill
                        : FlutterRemix.checkbox_blank_circle_line,
                    size: 24.r,
                    color: isSelected
                        ? AppColors.green
                        : AppColors.secondaryIconTextColor(),
                  ),
                  16.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${delivery.translation?.title}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          letterSpacing: -0.7,
                          color: AppColors.iconAndTextColor(),
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        NumberFormat.currency(
                          symbol:
                              LocalStorage.instance.getSelectedCurrency()?.symbol,
                        ).format(delivery.price),
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          letterSpacing: -0.4,
                          color: AppColors.iconAndTextColor(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '${delivery.times?[0]} ${AppHelpers.getTranslation(TrKeys.to).toLowerCase()} ${delivery.times?[1]} ${AppHelpers.getTranslation(TrKeys.hours).toLowerCase()}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  letterSpacing: -0.4,
                  color: AppColors.iconAndTextColor(),
                ),
              ),
            ],
          ),
          18.verticalSpace,
          Divider(
            thickness: 1.r,
            height: 1.r,
            color: AppColors.unrated,
          ),
        ],
      ),
    );
  }
}
