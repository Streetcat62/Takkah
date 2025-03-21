import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../styles/style.dart';
import 'widgets/logout_button.dart';
import 'widgets/sections_item.dart';
import 'widgets/shop_page_banner.dart';
import '../../component/components.dart';
import '../../routes/app_router.gr.dart';
import 'widgets/edit_restaurant_modal.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

class ShopPage extends ConsumerStatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends ConsumerState<ShopPage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => listen(_controller));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(() => listen(_controller));
  }

  void listen(ScrollController controller) {
    final direction = controller.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      ref.read(mainProvider.notifier).changeScrolling(true);
    } else if (direction == ScrollDirection.forward) {
      ref.read(mainProvider.notifier).changeScrolling(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Style.white,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            slivers: <Widget>[
              const ShopBanner(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(restaurantProvider);
                        return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: REdgeInsets.only(
                            right: 16,
                            left: 16,
                            bottom: MediaQuery.of(context).padding.bottom,
                          ),
                          shrinkWrap: true,
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppHelpers.truncate(
                                    '${state.shop?.translation?.title ?? LocalStorage.instance.getShop()?.translation?.title}',
                                    16,
                                  ),
                                  style: Style.interSemi(
                                    size: 22.sp,
                                    color: Style.blackColor,
                                  ),
                                ),
                                Container(
                                  width: 4.w,
                                  height: 4.h,
                                  margin: REdgeInsets.symmetric(horizontal: 8),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Style.textColor,
                                  ),
                                ),
                                Icon(
                                  FlutterRemix.star_smile_fill,
                                  color: Style.starColor,
                                  size: 20.r,
                                ),
                                4.horizontalSpace,
                                Text(
                                  '${LocalStorage.instance.getShop()?.ratingAvg} (${LocalStorage.instance.getShop()?.reviewCount})',
                                  style: Style.interNormal(
                                    size: 12.sp,
                                    color: Style.blackColor,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 22.w,
                                  height: 22.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Style.redColor,
                                  ),
                                  child: Icon(
                                    FlutterRemix.percent_fill,
                                    color: Style.white,
                                    size: 12.r,
                                  ),
                                ),
                                14.horizontalSpace,
                                Container(
                                  width: 22.w,
                                  height: 22.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Style.primaryColor,
                                  ),
                                  child: Icon(
                                    FlutterRemix.flashlight_fill,
                                    size: 16.r,
                                  ),
                                )
                              ],
                            ),
                            ReadMoreText(
                              '${state.shop?.translation?.description}',
                              style: Style.interNormal(
                                size: 13.sp,
                                color: Style.blackColor,
                              ),
                              trimLines: 2,
                              colorClickableText: Style.blackColor,
                              trimMode: TrimMode.Line,
                              trimCollapsedText:
                                  AppHelpers.trans(TrKeys.showMore),
                              trimExpandedText:
                                  AppHelpers.trans(TrKeys.showLess),
                              lessStyle: Style.interBold(
                                size: 13.sp,
                                color: Style.blackColor,
                              ),
                              moreStyle: Style.interBold(
                                size: 13.sp,
                                color: Style.blackColor,
                              ),
                            ),

                            Container(
                              height: 46.r,
                              margin: EdgeInsets.only(top: 24.h, bottom: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: Style.borderColor,
                                  width: 1.r,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    FlutterRemix.time_fill,
                                    size: 20.r,
                                    color: Style.blackColor,
                                  ),
                                  10.horizontalSpace,
                                  RichText(
                                    text: TextSpan(
                                      text: AppHelpers.trans(TrKeys
                                                  .theShopIsClosedToday) ==
                                              AppHelpers
                                                  .getShopWorkingTimeForToday()
                                          ? ''
                                          : '${AppHelpers.trans(TrKeys.workingHours)}:',
                                      style: Style.interRegular(
                                          color: Style.blackColor, size: 12.sp),
                                      children: [
                                        TextSpan(
                                          text:
                                              ' ${AppHelpers.getShopWorkingTimeForToday()}',
                                          style: Style.interSemi(
                                              color: Style.blackColor,
                                              size: 13.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 74.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: Style.borderColor),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: REdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FlutterRemix.coins_fill,
                                      size: 45.r,
                                      color: Style.blackColor,
                                    ),
                                    10.horizontalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          AppHelpers.trans(TrKeys.balance),
                                          style: Style.interNormal(
                                            size: 14.sp,
                                            color: Style.blackColor,
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                            symbol: LocalStorage.instance
                                                .getShop()
                                                ?.seller
                                                ?.wallet
                                                ?.symbol,
                                          ).format(
                                            LocalStorage.instance
                                                    .getShop()
                                                    ?.seller
                                                    ?.wallet
                                                    ?.price ??
                                                0,
                                          ),
                                          style: Style.interSemi(
                                            size: 18.sp,
                                            color: Style.blackColor,
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 1.r,
                                      height: 46.r,
                                      color: Style.blackColor.withOpacity(0.1),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      FlutterRemix.bar_chart_line,
                                      size: 24.r,
                                      color: Style.blackColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // _notification(context),
                            _sections(context),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Consumer(builder: (context, ref, child) {
            return LogoutButton(
              isOpen: ref.watch(restaurantProvider).shop?.open ?? false,
              onChange: () {
                ref.read(restaurantProvider.notifier).setOnlineOffline();
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _sections(BuildContext context) {
    return Column(
      children: [
        20.verticalSpace,
        TitleAndIcon(title: AppHelpers.trans(TrKeys.sections)),
        8.verticalSpace,
        SectionsItem(
          title: AppHelpers.trans(TrKeys.shopSettings),
          icon: FlutterRemix.restaurant_line,
          onTap: () => AppHelpers.showCustomModalBottomSheet(
            paddingTop: MediaQuery.of(context).padding.top + 60,
            context: context,
            modal: const EditRestaurantModal(),
            isDarkMode: false,
          ),
        ),
        SectionsItem(
          title: AppHelpers.trans(TrKeys.income),
          icon: FlutterRemix.line_chart_line,
          onTap: () => context.pushRoute(const IncomeRoute()),
        ),
        SectionsItem(
          title: AppHelpers.trans(TrKeys.myOrderHistory),
          icon: FlutterRemix.history_line,
          onTap: () => context.pushRoute(const OrderHistoryRoute()),
        ),
        80.verticalSpace
      ],
    );
  }
}
