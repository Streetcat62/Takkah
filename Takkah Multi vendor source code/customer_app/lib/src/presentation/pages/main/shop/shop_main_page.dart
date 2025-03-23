import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../../core/constants/constants.dart';
import 'riverpod/provider/shop_cart_provider.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../riverpod/provider/app_provider.dart';
import 'riverpod/provider/shop_main_bottom_provider.dart';
import 'details/riverpod/provider/shop_category_products_provider.dart';

class ShopMainPage extends ConsumerStatefulWidget {
  final int? shopId;
  final bool fromDelivery;

  const ShopMainPage({Key? key, this.shopId, required this.fromDelivery})
      : super(key: key);

  @override
  ConsumerState<ShopMainPage> createState() => _ShopMainPageState();
}

class _ShopMainPageState extends ConsumerState<ShopMainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(shopMainBottomProvider.notifier).setVisible(true);
        if (LocalStorage.instance.getUser() != null) {
          ref.read(shopCartProvider.notifier).fetchShopCart(
                shopId: widget.shopId,
                afterFetched: () {
                  ref
                      .read(shopCategoryProductsProvider.notifier)
                      .updateShopCategories(
                        context,
                        shopId: widget.shopId,
                        cartData: ref.watch(shopCartProvider).cartData,
                      );
                },
              );
        } else {
          ref
              .read(shopCategoryProductsProvider.notifier)
              .updateShopCategories(context, shopId: widget.shopId);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(appProvider);
    return KeyboardDismisser(
      child: AutoTabsScaffold(
        backgroundColor: AppColors.mainBackground(),
        appBarBuilder: (context, tabsRouter) {
          return tabsRouter.activeIndex == 1
              ? CommonAppBar(
                  title: AppHelpers.getTranslation(TrKeys.recipes),
                  hasBack: false,
                  onLeadingPressed: context.popRoute,
                )
              : (tabsRouter.activeIndex == 2
                  ? CommonAppBar(
                      title: AppHelpers.getTranslation(TrKeys.discounts),
                      hasBack: false,
                      onLeadingPressed: context.popRoute,
                    )
                  : const PreferredSize(
                      preferredSize: Size.fromHeight(0),
                      child: SizedBox.shrink(),
                    ));
        },
        routes: [
          ShopDetailsRoute(
            shopId: widget.shopId,
            fromDelivery: widget.fromDelivery,
          ),
          ShopRecipesRoute(shopId: widget.shopId),
          SavedProductsRoute(shopId: widget.shopId),
        ],
        bottomNavigationBuilder: (context, tabRouter) {
          return Consumer(
            builder: (context, ref, child) {
              final bottomState = ref.watch(shopMainBottomProvider);
              return bottomState.isVisible
                  ? ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                        child: Container(
                          height: Platform.isAndroid ? 72.r : 99.r,
                          decoration: BoxDecoration(
                            color: AppColors.mainAppbarBack().withOpacity(0.7),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.mainAppbarShadow(),
                                spreadRadius: 25.r,
                                blurRadius: 35.r,
                                offset: Offset(0.r, 0.r),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: BottomNavigationBar(
                            selectedItemColor: AppColors.green,
                            unselectedItemColor: AppColors.gray,
                            backgroundColor: AppColors.mainAppbarBack(),
                            onTap: (index) {
                              if (index == 3) {
                                if (LocalStorage.instance.getToken().isEmpty) {
                                  context.router.popUntilRoot();
                                  context.replaceRoute(const LoginRoute());
                                  AppHelpers.showCheckFlash(
                                    context,
                                    AppHelpers.getTranslation(
                                        TrKeys.youNeedToLoginFirst),
                                  );
                                } else {
                                  context.pushRoute(
                                    CartRoute(shopId: widget.shopId),
                                  );
                                }
                                return;
                              } else if (index == 4) {
                                context.pushRoute(
                                    ProfileRoute(shopId: widget.shopId));
                                return;
                              }
                              tabRouter.setActiveIndex(index);
                            },
                            type: BottomNavigationBarType.fixed,
                            elevation: 0,
                            showSelectedLabels: false,
                            showUnselectedLabels: false,
                            items: [
                              _barItem(
                                iconData: FlutterRemix.store_2_fill,
                                isSelected: tabRouter.activeIndex == 0,
                              ),
                              _barItem(
                                iconData: FlutterRemix.apps_2_fill,
                                isSelected: tabRouter.activeIndex == 1,
                              ),
                              _barItem(
                                iconData: FlutterRemix.heart_3_fill,
                                isSelected: tabRouter.activeIndex == 2,
                              ),
                              _barItem(
                                iconData: FlutterRemix.shopping_bag_3_fill,
                                isSelected: tabRouter.activeIndex == 3,
                              ),
                              BottomNavigationBarItem(
                                icon: CommonImage(
                                  imageUrl:
                                      LocalStorage.instance.getUser()?.img,
                                  width: 34,
                                  height: 34,
                                  radius: 20,
                                ),
                                label: '',
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _barItem({
    required IconData iconData,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: isSelected ? AppColors.green : AppColors.gray,
        size: 24.r,
      ),
      label: '',
    );
  }
}
