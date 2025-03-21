import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';

class ProductTitlePriceWidget extends StatelessWidget {
  final ProductData? productData;

  const ProductTitlePriceWidget({Key? key, this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        productData?.discount != null && ((productData?.discount ?? 0) > 0);
    final discountPrice = hasDiscount
        ? ((productData?.price ?? 0) - (productData?.discount ?? 0))
        : 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${productData?.product?.translation?.title}',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.4,
            color: AppColors.iconAndTextColor(),
          ),
        ),
        22.verticalSpace,
        Divider(
          thickness: 1.r,
          height: 1.r,
          color: AppColors.iconAndTextColor().withOpacity(0.04),
        ),
        24.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (productData != null)
                  Text(
                    NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency()?.symbol,
                    ).format(hasDiscount ? discountPrice : productData?.price),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                if (hasDiscount)
                  Row(
                    children: [
                      11.horizontalSpace,
                      const SmallDot(),
                      12.horizontalSpace,
                      Text(
                        NumberFormat.currency(
                          symbol: LocalStorage.instance
                              .getSelectedCurrency()
                              ?.symbol,
                        ).format(productData?.price),
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.iconAndTextColor(),
                          letterSpacing: -0.4,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  )
              ],
            ),
            if (hasDiscount)
              Container(
                height: 30.r,
                padding: REdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: AppColors.red,
                ),
                child: Row(
                  children: [
                    Icon(
                      FlutterRemix.price_tag_3_fill,
                      size: 16.r,
                      color: AppColors.white,
                    ),
                    8.horizontalSpace,
                    RichText(
                      text: TextSpan(
                        text: '${AppHelpers.getTranslation(TrKeys.sale)} ',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: AppColors.white,
                          letterSpacing: -0.4,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '${((productData?.discount ?? 0) / (productData?.price ?? 1) * 100).toStringAsFixed(1)}% - ${NumberFormat.currency(symbol: LocalStorage.instance.getSelectedCurrency()?.symbol).format(productData?.discount)} ',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              color: AppColors.white,
                              letterSpacing: -0.4,
                            ),
                          ),
                          TextSpan(
                            text: AppHelpers.getTranslation(TrKeys.off),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: AppColors.white,
                              letterSpacing: -0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
