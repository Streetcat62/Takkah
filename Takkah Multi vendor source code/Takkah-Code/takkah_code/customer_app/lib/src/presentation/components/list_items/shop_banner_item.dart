import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';

class ShopBannerItem extends StatelessWidget {
  final int? shopId;
  final BannerData banner;

  const ShopBannerItem({Key? key, required this.banner, this.shopId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.r),
      child: Stack(
        children: [
          Hero(
            tag: '${AppConstants.tagHeroBannerImage}${banner.id}',
            child: CommonImage(
              imageUrl: banner.img,
              width: 1.sw - 32,
              height: 180,
              radius: 16,
            ),
          ),
          Positioned(
            left: 31.r,
            bottom: 19.r,
            child: Material(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.showDetailButton,
              child: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: () => context.pushRoute(
                  BannerDetailsRoute(banner: banner, shopId: shopId),
                ),
                child: Container(
                  height: 34.r,
                  alignment: Alignment.center,
                  padding: REdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.showDetails),
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
