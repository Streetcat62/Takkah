import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import 'cart_product_item.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class UserCartItem extends StatelessWidget {
  final UserCartData? cartItem;
  final ValueSetter<int> onIncrease;
  final ValueSetter<int> onDecrease;
  final ValueSetter<int> onDelete;

  const UserCartItem({
    Key? key,
    this.cartItem,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              cartItem?.name ?? '',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                color: AppColors.iconAndTextColor(),
                letterSpacing: -1,
              ),
            ),
            10.horizontalSpace,
            if (cartItem?.userId == null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: cartItem?.status == 1
                      ? AppColors.unratedIcon()
                      : AppColors.green,
                ),
                padding: REdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  cartItem?.status == 1
                      ? '${AppHelpers.getTranslation(TrKeys.choosing)}...'
                      : AppHelpers.getTranslation(TrKeys.ready),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: cartItem?.status == 1
                        ? AppColors.iconAndTextColor()
                        : AppColors.white,
                    letterSpacing: -0.4,
                  ),
                ),
              ),
          ],
        ),
        20.verticalSpace,
        ListView.builder(
          itemCount: cartItem?.cartDetails?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CartProductItem(
              detailItem: cartItem?.cartDetails?[index],
              onIncrease: () {
                onIncrease(index);
              },
              onDecrease: () {
                onDecrease(index);
              },
              onDelete: () {
                onDelete(index);
              },
            );
          },
        ),
        20.verticalSpace,
      ],
    );
  }
}
