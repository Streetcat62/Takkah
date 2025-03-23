import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sundaymart/src/core/utils/app_helpers.dart';

import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/routes/app_router.gr.dart';

class HorizontalShopItem extends StatelessWidget {
  final ShopData shop;
  final bool fromDelivery;

  const HorizontalShopItem({
    Key? key,
    required this.shop,
    required this.fromDelivery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256.h,
      margin: EdgeInsetsDirectional.only(end: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.mainAppbarBack(),
      ),
      child: GestureDetector(
        onTap: () => context.pushRoute(
          ShopMainRoute(shopId: shop.id, fromDelivery: fromDelivery),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
              child: CommonImage(
                imageUrl: shop.logoImg,
                height: 118,
                width: 170,
                radius: 0,
              ),
            ),
            Container(
              width: 170.r,
              padding: REdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${shop.translation?.title}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    '${shop.translation?.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.secondaryIconTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: REdgeInsets.all(16),
              width: 170.r,
              decoration: BoxDecoration(
                color: AppColors.secondaryBack(),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
              alignment: AlignmentDirectional.centerStart,
              child:  shop.shopWorkingDay?.isNotEmpty ?? false ?  Row(
                children: [
                  Icon(
                    FlutterRemix.time_fill,
                    size: 14.r,
                    color: AppColors.warning,
                  ),
                  4.horizontalSpace,
                    Text(AppHelpers.checkWorkDate(shop.shopWorkingDay),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.secondaryIconTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              )
              : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
