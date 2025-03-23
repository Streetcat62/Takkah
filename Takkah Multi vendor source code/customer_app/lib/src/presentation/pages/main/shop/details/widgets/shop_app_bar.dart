import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'market_info_text.dart';
import '../../../../../theme/theme.dart';
import 'confirm_together_order_modal.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../riverpod/provider/open_cart_provider.dart';
import '../../../../../../core/constants/constants.dart';
import '../../riverpod/provider/shop_cart_provider.dart';
import '../../../../../../core/routes/app_router.gr.dart';

class ShopAppBar extends StatelessWidget {
  final ShopData? shop;

  const ShopAppBar({Key? key, this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return FlexibleSpaceBar(
          titlePadding:
              REdgeInsets.symmetric(vertical: Platform.isAndroid ? 18 : 0),
          expandedTitleScale: Platform.isAndroid ? 46 / 26 : 1.5,
          title: Padding(
            padding: REdgeInsets.only(
              bottom: Platform.isAndroid
                  ? ((15 * constraints.biggest.height - 1200) / 57)
                  : ((44 * constraints.biggest.height - 676) / 241),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: context.popRoute,
                  child: Row(
                    children: [
                      14.horizontalSpace,
                      Hero(
                        tag: AppConstants.tagHeroMarketLogo,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainAppbarBack(),
                            shape: BoxShape.circle,
                          ),
                          width: 30.r,
                          height: 30.r,
                          alignment: Alignment.center,
                          child: CommonImage(
                            imageUrl: shop?.logoImg,
                            width: 26,
                            height: 26,
                            radius: 13,
                          ),
                        ),
                      ),
                      6.horizontalSpace,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Hero(
                                tag: AppConstants.tagHeroMarketTitle,
                                child: Text(
                                  (shop?.translation?.title?.length ?? 0) > 14
                                      ? '${shop?.translation?.title?.substring(0, 14)}'
                                      : '${shop?.translation?.title}',
                                  style: GoogleFonts.inter(
                                    color: (constraints.biggest.height < 120.r)
                                        ? AppColors.iconAndTextColor()
                                        : AppColors.white,
                                    fontSize: 14.sp,
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              4.horizontalSpace,
                              Icon(
                                FlutterRemix.arrow_down_s_line,
                                size: 20.r,
                                color: (constraints.biggest.height < 120.r)
                                    ? AppColors.iconAndTextColor()
                                    : AppColors.white,
                              ),
                            ],
                          ),
                          if(shop?.shopWorkingDay?.isNotEmpty ?? false)
                          Text(
                            '${AppHelpers.getTranslation(TrKeys.workingHours)}: ${AppHelpers.checkWorkDate(shop?.shopWorkingDay)}',
                            style: GoogleFonts.inter(
                              color: (constraints.biggest.height < 120.r)
                                  ? AppColors.iconAndTextColor()
                                  : AppColors.white,
                              fontSize: 9.sp,
                              letterSpacing: -1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.r),
                  child: CircleIconButton(
                    onTap: () => context.pushRoute(const NotificationsRoute()),
                    iconData: FlutterRemix.notification_fill,
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
          background: Container(
            color: AppColors.mainBackground(),
            child: Stack(
              children: [
                Stack(
                  children: [
                    CommonImage(
                      imageUrl: shop?.backgroundImg,
                      width: double.infinity,
                      height: 275,
                      radius: 0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 275.r,
                      decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.35),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      14.verticalSpace,
                      Container(
                        height: 50.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: AppColors.mainAppbarBack(),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MarketInfoText(
                              iconData: FlutterRemix.information_fill,
                              text:
                                  AppHelpers.getTranslation(TrKeys.marketInfo),
                              onTap: () => context
                                  .pushRoute(MarketInfoRoute(shop: shop)),
                            ),
                            32.horizontalSpace,
                            Container(
                              width: 1.r,
                              height: 23.r,
                              color: AppColors.secondaryBack(),
                            ),
                            32.horizontalSpace,
                            Consumer(
                              builder: (context, ref, child) {
                                return MarketInfoText(
                                  iconData: FlutterRemix.group_2_fill,
                                  text: AppHelpers.getTranslation(
                                      TrKeys.togetherOrder),
                                  onTap: () {
                                    if (LocalStorage.instance.getUser() ==
                                        null) {
                                      AppHelpers.showCheckFlash(
                                        context,
                                        AppHelpers.getTranslation(
                                            TrKeys.youNeedToLoginFirst),
                                      );
                                      context.router.pushAndPopUntil(
                                        const LoginRoute(),
                                        predicate: (route) => false,
                                      );
                                    } else {
                                      ref
                                          .read(openCartProvider.notifier)
                                          .setCartData(
                                            cartData: ref
                                                .watch(shopCartProvider)
                                                .cartData,
                                          );
                                      AppHelpers.showCustomModalBottomSheet(
                                        context: context,
                                        modal: ConfirmTogetherOrderModal(
                                          shopId: shop?.id,
                                        ),
                                        radius: 15,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
