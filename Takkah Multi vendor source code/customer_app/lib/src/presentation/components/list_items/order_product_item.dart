import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';

class OrderProductItem extends StatelessWidget {
  final OrderDetail? orderDetail;

  const OrderProductItem({Key? key, this.orderDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          CommonImage(
            imageUrl: orderDetail?.shopProduct?.product?.img,
            width: 52,
            height: 52,
            radius: 0,
          ),
          24.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${orderDetail?.shopProduct?.product?.translation?.title}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    letterSpacing: -0.4,
                    color: AppColors.iconAndTextColor(),
                  ),
                ),
                3.verticalSpace,
                Row(
                  children: [
                    Text(
                      NumberFormat.currency(
                        symbol:
                            LocalStorage.instance.getSelectedCurrency()?.symbol,
                      ).format(orderDetail?.shopProduct?.price ?? 0),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        letterSpacing: -0.4,
                        color: AppColors.iconAndTextColor(),
                      ),
                    ),
                    9.horizontalSpace,
                    Icon(
                      FlutterRemix.close_fill,
                      size: 16.r,
                      color: AppColors.iconAndTextColor(),
                    ),
                    9.horizontalSpace,
                    Text(
                      '${orderDetail?.quantity}',
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
          ),
        ],
      ),
    );
  }
}
