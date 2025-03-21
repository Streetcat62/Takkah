import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../core/utils/utils.dart';
import '../../components/components.dart';
import 'widgets/user_address_app_bar.dart';
import 'riverpod/provider/main_provider.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';
import 'widgets/bottom_navigation_bar_button.dart';
import 'riverpod/provider/main_bottom_provider.dart';
import '../../../riverpod/provider/app_provider.dart';
import 'riverpod/provider/main_shop_search_provider.dart';
import 'riverpod/provider/main_product_search_provider.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: KeyboardDismisser(
        child: AutoTabsScaffold(
          backgroundColor: AppColors.mainBackground(
            isDarkMode: ref.watch(appProvider).isDarkMode,
          ),
          extendBody: true,
          appBarBuilder: (context, tabsRouter) {
            final statusBarHeight = MediaQuery.of(context).padding.top;
            final appBarHeight = AppBar().preferredSize.height;
            return PreferredSize(
              preferredSize:
                  Size.fromHeight(statusBarHeight + appBarHeight + 60.r),
              child: Consumer(
                builder: (context, ref, child) {
                  return UserAddressAppBar(
                    height: statusBarHeight + appBarHeight,
                    searchHeight: 60.r,
                    address: AppHelpers.getActiveLocalAddress()?.title ?? "Select delivery address",
                    onChangeTap: () =>
                        context.pushRoute(const SavedLocationsRoute()),
                    onTextFieldChange: (text) =>
                        ref.read(mainProvider.notifier).setQuery(
                              context,
                              query: text,
                              tabsRouter: tabsRouter,
                              shopSearchNotifier:
                                  ref.read(mainShopSearchProvider.notifier),
                              productSearchNotifier:
                                  ref.read(mainProductSearchProvider.notifier),
                            ),
                  );
                },
              ),
            );
          },
          builder: (context, child, animation) => SlideTransition(
            position: Tween<Offset>(
              begin: Offset(
                context.tabsRouter.activeIndex == 0 ? 1.0 : -1.0,
                0.0,
              ),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          ),
          routes: const [
            DeliveryRoute(),
            PickupRoute(),
            SearchShopsRoute(),
          ],
          bottomNavigationBuilder: (context, tabRouter) => Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(mainBottomProvider);
              return ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: state.isVisible
                        ? (Platform.isAndroid ? 90.r : 80.r)
                        : 0,
                    decoration: BoxDecoration(
                      color: AppColors.mainAppbarBack().withOpacity(0.7),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mainAppbarShadow(),
                          spreadRadius: 25.r,
                          blurRadius: 17.r,
                          offset: Offset(0.r, 0.r),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BottomNavigationBarButton(
                          iconData: FlutterRemix.store_2_fill,
                          isSelected: tabRouter.activeIndex == 0,
                          label: AppHelpers.getTranslation(TrKeys.delivery),
                          onTap: () {
                            tabRouter.setActiveIndex(0);
                          },
                        ),
                        BottomNavigationBarButton(
                          iconData: FlutterRemix.map_2_fill,
                          isSelected: tabRouter.activeIndex == 1,
                          label: AppHelpers.getTranslation(TrKeys.pickup),
                          onTap: () {
                            tabRouter.setActiveIndex(1);
                          },
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20.r),
                          onTap: () =>
                              context.pushRoute(ProfileRoute(fromHome: true)),
                          child: CommonImage(
                            imageUrl: LocalStorage.instance.getUser()?.img,
                            width: 40,
                            height: 40,
                            radius: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
