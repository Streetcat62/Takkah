import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/local_storage.dart';
import '../../../models/data/local_cart.dart';
import '../../theme/theme.dart';
import 'animated_button_effect.dart';
import '../../../models/models.dart';

class ProductCartCountButton extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final String title;
  final int? productId;
  final Unit? unit;

  const ProductCartCountButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.onIncrease,
    required this.onDecrease,
    this.productId,
    this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int quantity = LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productId, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    return Material(
      borderRadius: BorderRadius.circular(100.r),
      color: (quantity > 0)
          ? AppColors.mainAppbarBack()
          : AppColors.green,
      child: InkWell(
        borderRadius: BorderRadius.circular(100.r),
        onTap: ( quantity > 0) ? null : onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
          ),
          height: 60.r,
          alignment: Alignment.center,
          child: (quantity > 0)
              ? Padding(
                  padding: REdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 48.h,
                        width: 54.w,
                        child: GestureDetector(
                          onTap: (){
                              onDecrease();
                            Vibrate.feedback(FeedbackType.selection);
                          },
                          child: AnimationButtonEffect(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.r,
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.bgGrey,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "-",
                                      style: AppStyle.interNoSemi(
                                        size: 16.sp,
                                        color: AppColors.lightBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        '$quantity',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: AppColors.iconAndTextColor(),
                          letterSpacing: -0.4,
                        ),
                      ),
                      9.horizontalSpace,
                     SizedBox(
                       height: 48.h,
                       width: 54.w,
                       child: GestureDetector(
                          onTap: (){
                            onIncrease();
                            Vibrate.feedback(FeedbackType.selection);
                          },
                          child: AnimationButtonEffect(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.r,
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.bgGrey,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "+",
                                      style: AppStyle.interNoSemi(
                                        size: 16.sp,
                                        color: AppColors.lightBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                     ),
                    ],
                  ),
                )
              : Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    letterSpacing: -0.4,
                  ),
                ),
        ),
      ),
    );
  }
}
