import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_helpers.dart';
import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/routes/app_router.gr.dart';

class VerticalShopItem extends StatelessWidget {
  final ShopData shop;
  final bool isLast;
  final bool fromDelivery;

  const VerticalShopItem({
    Key? key,
    required this.shop,
    required this.isLast,
    required this.fromDelivery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: REdgeInsets.symmetric(vertical: 24),
          child: InkWell(
            onTap: () => context.pushRoute(
              ShopMainRoute(shopId: shop.id, fromDelivery: fromDelivery),
            ),
            child: Row(
              children: [
                CommonImage(
                  imageUrl: shop.logoImg,
                  width: 80,
                  height: 80,
                  radius: 40,
                ),
                14.horizontalSpace,
                Expanded(
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
                      4.verticalSpace,
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
                      13.verticalSpace,
                      Row(
                        children: [
                          if(shop.shopWorkingDay?.isNotEmpty ?? false)
                          Text(AppHelpers.checkWorkDate(shop.shopWorkingDay),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -0.4,
                            ),
                          ),
                          if(shop.shopWorkingDay?.isNotEmpty ?? false)
                          14.horizontalSpace,
                          Icon(
                            FlutterRemix.star_smile_fill,
                            color: AppColors.warning,
                            size: 16.r,
                          ),
                          6.horizontalSpace,
                          Text(
                            '${shop.ratingAvg ?? 0.0}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -0.4,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (!isLast)
          Divider(
            thickness: 1.r,
            height: 1.r,
            color: AppColors.gray.withOpacity(0.2),
          ),
      ],
    );
  }
}
