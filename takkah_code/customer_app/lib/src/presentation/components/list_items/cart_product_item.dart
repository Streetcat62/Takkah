import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../small_dot.dart';
import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../increase_decrease_buttons.dart';
import '../buttons/circle_icon_button.dart';
import '../../../core/constants/constants.dart';

class CartProductItem extends StatelessWidget {
  final CartDetails? detailItem;
  final VoidCallback onIncrease;
  final VoidCallback onDelete;
  final VoidCallback onDecrease;

  const CartProductItem({
    Key? key,
    this.detailItem,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasDiscount = detailItem?.product?.discount != null &&
        ((detailItem?.product?.discount ?? 0) > 0);
    final discountPrice = hasDiscount
        ? ((detailItem?.product?.price ?? 0) -
            (detailItem?.product?.discount ?? 0))
        : 0;
    return Container(
      padding: REdgeInsets.all(14),
      margin: REdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.mainAppbarBack(),
        border: detailItem?.bonus == true
            ? Border.all(color: AppColors.green, width: 2.r)
            : null,
      ),
      child: Row(
        children: [
          CommonImage(
            imageUrl: detailItem?.product?.product?.img,
            width: 96,
            height: 96,
          ),
          22.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${detailItem?.product?.product?.translation?.title}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.iconAndTextColor(),
                    letterSpacing: -0.4,
                  ),
                ),
                3.verticalSpace,
                detailItem?.bonus == true
                    ? Text(
                        '+${detailItem?.quantity} ${AppHelpers.getTranslation(TrKeys.bonus).toLowerCase()}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: AppColors.iconAndTextColor(),
                          letterSpacing: -0.4,
                        ),
                      )
                    : Row(
                        children: [
                          Text(
                            NumberFormat.currency(
                              symbol: LocalStorage.instance
                                  .getSelectedCurrency()
                                  ?.symbol,
                            ).format(hasDiscount
                                ? discountPrice
                                : (detailItem?.product?.price ?? 0)),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -0.4,
                            ),
                          ),
                          12.horizontalSpace,
                          if (hasDiscount)
                            Row(
                              children: [
                                Text(
                                  NumberFormat.currency(
                                    symbol: LocalStorage.instance
                                        .getSelectedCurrency()
                                        ?.symbol,
                                  ).format(detailItem?.product?.price),
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: AppColors.iconAndTextColor(),
                                    letterSpacing: -0.4,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                8.horizontalSpace,
                                const SmallDot(),
                                8.horizontalSpace,
                                Text(
                                  '${AppHelpers.getTranslation(TrKeys.sale)} - ${(detailItem?.product?.discount ?? 0) / (detailItem?.product?.price ?? 1) * 100}%',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: AppColors.red,
                                    letterSpacing: -0.4,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                12.verticalSpace,
                if (detailItem?.bonus != true)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IncreaseDecreaseButtons(
                        onDecrease: onDecrease,
                        onIncrease: onIncrease,
                        buttonSize: 36,
                        cartCount: detailItem?.localQuantity,
                      ),
                      CircleIconButton(
                        onTap: onDelete,
                        iconData: FlutterRemix.delete_bin_5_fill,
                        backgroundColor: AppColors.bgGrey,
                        iconColor: AppColors.secondaryIconTextColor(),
                        width: 36,
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
