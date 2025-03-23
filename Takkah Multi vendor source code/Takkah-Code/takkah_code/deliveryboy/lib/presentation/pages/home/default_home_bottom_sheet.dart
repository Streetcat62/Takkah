import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/home_store_item.dart';
import '../../styles/style.dart';
import 'widgets/free_lunch_widget.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

class DefaultHomeBottomSheet extends StatefulWidget {
  final bool isScrolling;

  const DefaultHomeBottomSheet({Key? key, required this.isScrolling})
      : super(key: key);

  @override
  State<DefaultHomeBottomSheet> createState() => _DefaultHomeBottomSheetState();
}

class _DefaultHomeBottomSheetState extends State<DefaultHomeBottomSheet> {
  final List<String> image = [
    'https://www.deliveryhero.com/wp-content/uploads/2021/01/TAR_5922.jpg',
    'https://images.ctfassets.net/trvmqu12jq2l/1LFP1rAaPMiEx5y11ZZv2F/5167948e81a58a08e516631e07ee154c/blog-hero-1208x1080-v115.14.01.jpg',
    'https://images.unsplash.com/photo-1566576721346-d4a3b4eaeb55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFja2FnZSUyMGRlbGl2ZXJ5fGVufDB8fDB8fA%3D%3D&w=1000&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: widget.isScrolling ? -280.h : 0,
      duration: const Duration(milliseconds: 400),
      child: Container(
        height: 336.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Style.greyColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.r),
            topLeft: Radius.circular(12.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Style.blackColor.withOpacity(0.25),
              blurRadius: 40,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          top: 8.h,
          bottom: MediaQuery.of(context).padding.bottom + 16.h,
        ),
        child: Column(
          children: [
            Container(
              height: 4.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: Style.bottomSheetIconColor,
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
            Column(
              children: [
                18.verticalSpace,
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _balance(context),
                      _benefit(context),
                    ],
                  ),
                ),
                SizedBox(
                  height: 186.h,
                  child: ListView.builder(
                    padding:
                        EdgeInsets.only(top: 24.h, left: 16.r, right: 16.r),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => index == 0
                        ? const FreeLunchWidget()
                        : HomeStoreItem(image: image[index - 1]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _benefit(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.pushRoute(const OrdersRoute());
      },
      child: Container(
        height: 64.h,
        width: (MediaQuery.of(context).size.width - 42.w) / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Style.primaryColor),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Row(
          children: [
            Container(
              width: 36.r,
              height: 36.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Style.blackColor,
              ),
              child: const Icon(
                FlutterRemix.file_list_2_fill,
                color: Style.primaryColor,
              ),
            ),
            14.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                4.verticalSpace,
                SizedBox(
                  width: 60.w,
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.benefit),
                    style: Style.interNormal(size: 12.sp, letterSpacing: -0.3),
                    maxLines: 1,
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return Text(
                      intl.NumberFormat.currency(
                                symbol: LocalStorage.instance
                                    .getSelectedCurrency()!
                                    .symbol,
                              )
                                  .format(ref
                                          .watch(profileSettingsProvider)
                                          .statistics
                                          ?.data
                                          ?.totalPrice ??
                                      0)
                                  .length <
                              10
                          ? intl.NumberFormat.currency(
                              symbol: LocalStorage.instance
                                  .getSelectedCurrency()!
                                  .symbol,
                            ).format((ref
                                  .watch(profileSettingsProvider)
                                  .statistics
                                  ?.data
                                  ?.totalPrice ??
                              0))
                          : '${LocalStorage.instance.getSelectedCurrency()!.symbol}${intl.NumberFormat.compact().format((ref.watch(profileSettingsProvider).statistics?.data?.totalPrice ?? 0))}',
                      style: Style.interSemi(size: 14.sp, letterSpacing: -0.3),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _balance(BuildContext context) {
    return Container(
      height: 64.h,
      width: (MediaQuery.of(context).size.width - 42.w) / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Style.white),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.svgBalance),
          14.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.balance),
                style: Style.interNormal(size: 12.sp, letterSpacing: -0.3),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return Text(
                    intl.NumberFormat.currency(
                              symbol: LocalStorage.instance
                                  .getSelectedCurrency()
                                  ?.symbol,
                            )
                                .format(LocalStorage.instance
                                        .getUser()
                                        ?.wallet
                                        ?.price ??
                                    0)
                                .length <
                            10
                        ? intl.NumberFormat.currency(
                            symbol: LocalStorage.instance
                                .getSelectedCurrency()!
                                .symbol,
                          ).format(
                            LocalStorage.instance.getUser()?.wallet?.price ?? 0)
                        : '${LocalStorage.instance.getSelectedCurrency()?.symbol}${intl.NumberFormat.compact().format(LocalStorage.instance.getUser()?.wallet?.price ?? 0)}',
                    style: Style.interSemi(size: 14.sp, letterSpacing: -0.3),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
