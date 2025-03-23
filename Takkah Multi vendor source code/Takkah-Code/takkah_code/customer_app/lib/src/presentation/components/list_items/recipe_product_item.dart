import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../increase_decrease_buttons.dart';

class RecipeProductItem extends StatelessWidget {
  final RecipeProduct? product;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const RecipeProductItem({
    Key? key,
    this.product,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: AppColors.secondaryBack(), width: 4.r),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: CommonImage(
                imageUrl: product?.product?.product?.img,
                width: 90,
                height: 90,
                radius: 15,
              ),
            ),
            18.horizontalSpace,
            Expanded(
              child: SizedBox(
                height: 90.r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product?.product?.product?.translation?.title}',
                      maxLines: 2,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.iconAndTextColor(),
                        letterSpacing: -0.4,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          NumberFormat.currency(
                            symbol: LocalStorage.instance
                                .getSelectedCurrency()
                                ?.symbol,
                          ).format(product?.product?.price),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            color: AppColors.iconAndTextColor(),
                            letterSpacing: -0.4,
                          ),
                        ),
                        IncreaseDecreaseButtons(
                          buttonSize: 40,
                          unit: product?.product?.product?.unit,
                          cartCount: product?.quantity,
                          onDecrease: onDecrease,
                          onIncrease: onIncrease,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        18.verticalSpace,
      ],
    );
  }
}
