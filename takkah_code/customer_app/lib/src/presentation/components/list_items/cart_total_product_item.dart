import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';

class CartTotalProductItem extends StatelessWidget {
  final UserCartData? product;

  const CartTotalProductItem({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: product?.cartDetails?.length,
        itemBuilder: (context, index) {
          final hasDiscount = product?.cartDetails?[index].quantity !=
                  null &&
              ((product?.cartDetails?[index].product?.discount ?? 0) > 0);
          final discountPrice = hasDiscount
              ? ((product?.cartDetails?[index].product?.price ?? 0) -
                  (product?.cartDetails?[index].product?.discount ?? 0))
              : 0;
          return Column(
            children: [
              15.verticalSpace,
              Row(
                children: [
                  CommonImage(
                    imageUrl:
                        product?.cartDetails?[index].product?.product?.img,
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
                          '${product?.cartDetails?[index].product?.product?.translation?.title}',
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
                                symbol: LocalStorage.instance
                                    .getSelectedCurrency()
                                    ?.symbol,
                              ).format(hasDiscount
                                  ? discountPrice
                                  : product
                                      ?.cartDetails?[index].product?.price),
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
                              '${product?.cartDetails?[index].quantity}',
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
            ],
          );
        });
  }
}
