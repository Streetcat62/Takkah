import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import 'widgets/logout_modal.dart';
import 'widgets/sections_item.dart';
import 'widgets/notification_item.dart';
import '../../component/components.dart';
import '../../routes/app_router.gr.dart';
import 'widgets/edit_profile_modal.dart';
import '../../../application/providers.dart';
import '../auth/login/widgets/languages_modal.dart';
import '../../../infrastructure/services/services.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileSettingsProvider);
    final bool isLtr = LocalStorage.instance.getLangLtr();
    ref.watch(appProvider);
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Style.greyColor,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            CustomAppBar(
              bottomPadding: 4.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: AppConstants.heroTagProfileAvatar,
                    child: Consumer(
                      builder: (context, ref, child) {
                        ref.watch(profileImageProvider);
                        return DriverAvatar(
                          imageUrl: LocalStorage.instance.getUser()?.img,
                          rate: LocalStorage.instance.getUser()?.rate,
                        );
                      },
                    ),
                  ),
                  10.horizontalSpace,
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${LocalStorage.instance.getUser()?.firstname} ${LocalStorage.instance.getUser()?.lastname}',
                          style: Style.interSemi(size: 16.sp),
                        ),
                        Text(
                          LocalStorage.instance.getUser()?.phone ?? '',
                          style: Style.interRegular(size: 12.sp),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: ButtonsBouncingEffect(
                      child: GestureDetector(
                        onTap: () => AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal: const LogoutModal(),
                          isDarkMode: LocalStorage.instance.getAppThemeMode(),
                        ),
                        child: Icon(
                          FlutterRemix.logout_circle_r_line,
                          size: 24.r,
                          color: Style.blackColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: REdgeInsets.symmetric(vertical: 24),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Style.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    margin: REdgeInsets.symmetric(horizontal: 16),
                    padding: REdgeInsets.all(12.r),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.svgBalance),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppHelpers.getTranslation(TrKeys.balance),
                                style: Style.interNormal(
                                    size: 12.sp, letterSpacing: -0.3),
                              ),
                              Text(
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
                                      ).format(LocalStorage.instance
                                            .getUser()
                                            ?.wallet
                                            ?.price ??
                                        0)
                                    : '${LocalStorage.instance.getSelectedCurrency()!.symbol}${intl.NumberFormat.compact().format(LocalStorage.instance.getUser()?.wallet?.price ?? 0)}',
                                style: Style.interSemi(
                                  size: 14.sp,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const VerticalDivider(color: Style.borderColor),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppHelpers.getTranslation(TrKeys.lastProfit),
                                style: Style.interNormal(
                                    size: 12.sp, letterSpacing: -0.3),
                              ),
                              Text(
                                intl.NumberFormat.currency(
                                          symbol: LocalStorage.instance
                                              .getSelectedCurrency()!
                                              .symbol,
                                        )
                                            .format(ref
                                                    .watch(
                                                        profileSettingsProvider)
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
                                style: Style.interSemi(
                                  size: 14.sp,
                                  letterSpacing: -0.3,
                                  color: Style.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          32.horizontalSpace
                        ],
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      color: Style.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    margin: REdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.all(12.r),
                    child: Row(
                      children: [
                        Icon(FlutterRemix.checkbox_circle_fill, size: 30.r),
                        10.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppHelpers.getTranslation(TrKeys.orders),
                              style: Style.interNormal(
                                  size: 12.sp, letterSpacing: -0.3),
                            ),
                            Text(
                              (state.statistics?.data?.cancelOrdersCount ?? 0)
                                  .toString(),
                              style: Style.interSemi(
                                  size: 14.sp, letterSpacing: -0.3),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _notifications(context),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleAndIcon(
                          title: AppHelpers.getTranslation(TrKeys.sections),
                        ),
                        20.verticalSpace,
                        SectionsItem(
                          title:
                              AppHelpers.getTranslation(TrKeys.profileSettings),
                          icon: FlutterRemix.user_settings_line,
                          onTap: () => AppHelpers.showCustomModalBottomSheet(
                            paddingTop:
                                MediaQuery.of(context).padding.top + 32.h,
                            context: context,
                            modal: const EditProfileModal(),
                            isDarkMode: false,
                            isExpanded: true,
                          ),
                        ),
                        SectionsItem(
                          title: AppHelpers.getTranslation(TrKeys.orders),
                          icon: FlutterRemix.order_play_line,
                          onTap: () => context.pushRoute(const OrdersRoute()),
                        ),
                        SectionsItem(
                          title: AppHelpers.getTranslation(TrKeys.orderHistory),
                          icon: FlutterRemix.history_line,
                          onTap: () =>
                              context.pushRoute(const OrderHistoryRoute()),
                        ),
                        SectionsItem(
                          title: AppHelpers.getTranslation(TrKeys.income),
                          icon: FlutterRemix.line_chart_line,
                          onTap: () => context.pushRoute(const IncomeRoute()),
                        ),
                        Consumer(
                          builder: (context, ref, child) => SectionsItem(
                            title: AppHelpers.getTranslation(TrKeys.language),
                            icon: FlutterRemix.global_line,
                            onTap: () {
                              ref
                                  .read(languagesProvider.notifier)
                                  .fetchLanguages(context);
                              AppHelpers.showCustomModalBottomSheet(
                                isDismissible: true,
                                isDrag: false,
                                context: context,
                                modal: LanguagesModal(
                                  afterUpdate: ref
                                      .read(appProvider.notifier)
                                      .changeLanguage,
                                ),
                                isDarkMode: false,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  80.verticalSpace,
                ],
              ),
            )
          ],
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: Padding(
          padding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PopButton(),
              10.horizontalSpace,
              Expanded(
                child: CustomButton(
                  title: AppHelpers.getTranslation(TrKeys.onlineHelper),
                  textColor: Style.white,
                  onPressed: () {
                    final Uri launchUri =
                        Uri(scheme: 'tel', path: AppHelpers.getAppPhone());
                    launchUrl(launchUri);
                  },
                  icon: Icon(
                    FlutterRemix.chat_smile_2_fill,
                    color: Style.white,
                    size: 20.r,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _notifications(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Style.primaryColor,
                  shape: BoxShape.circle,
                ),
                height: 30.h,
                width: 30.w,
                child: Center(
                  child: Text(
                    '4',
                    style: Style.interSemi(size: 14.sp, color: Style.white),
                  ),
                ),
              ),
              12.horizontalSpace,
              Text(
                AppHelpers.getTranslation(TrKeys.notifications),
                style: Style.interSemi(size: 18.sp, color: Style.blackColor),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => context.pushRoute(const ListNotificationRoute()),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.seeAll),
                    style:
                        Style.interNormal(size: 14.sp, color: Style.blueColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: 136.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            physics: const BouncingScrollPhysics(),
            padding: REdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) => const NotificationItem(
              date: 'June 24',
              text: 'Check your settings you have notifications turned off',
            ),
          ),
        ),
        40.verticalSpace,
      ],
    );
  }
}
