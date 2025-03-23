import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../riverpod/provider/main_bottom_provider.dart';
import '../../../../riverpod/provider/app_provider.dart';
import 'riverpod/provider/saved_shops_in_pickup_provider.dart';
import 'riverpod/provider/shop_groups_in_pickup_provider.dart';
import 'riverpod/provider/filtered_shops_in_pickup_provider.dart';

class PickupPage extends ConsumerStatefulWidget {
  const PickupPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends ConsumerState<PickupPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          ref.read(mainBottomProvider.notifier).setVisible(false);
        }
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          ref.read(mainBottomProvider.notifier).setVisible(true);
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(savedShopsInPickupProvider.notifier).fetchSavedShops(
          checkYourNetwork: () {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          },
        );
        ref.read(filteredShopsInPickupProvider.notifier).fetchFilteredShops(
          checkYourNetwork: () {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          },
        );
        ref.read(shopGroupsInPickupProvider.notifier).fetchShopGroups(
          checkYourNetwork: () {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainBackground(
        isDarkMode: ref.watch(appProvider).isDarkMode,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final savedShopsInDeliveryState =
                    ref.watch(savedShopsInPickupProvider);
                return SavedShopsBody(
                  fromDelivery: false,
                  isLoading: savedShopsInDeliveryState.isSavedShopsLoading,
                  shops: savedShopsInDeliveryState.savedShops,
                );
              },
            ),
            32.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.allShops),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -1,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.pushRoute(const ViewOnMapRoute()),
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.viewOnMap),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.blue,
                        letterSpacing: -0.5,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final groupsState = ref.watch(shopGroupsInPickupProvider);
                final groupsNotifier =
                    ref.read(shopGroupsInPickupProvider.notifier);
                return SizedBox(
                  height: 34.r,
                  child: groupsState.isLoading
                      ? const HorizontalListShimmer(
                          horizontalPadding: 16,
                          itemBorderRadius: 100,
                          itemWidth: 100,
                          spacing: 8,
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: REdgeInsets.symmetric(horizontal: 16),
                          itemCount: groupsState.groups.length + 1,
                          itemBuilder: (context, index) {
                            return index == 0
                                ? ShopGroupItem(
                                    title:
                                        AppHelpers.getTranslation(TrKeys.all),
                                    onTap: () {
                                      groupsNotifier.setActiveIndex(0);
                                      ref
                                          .read(filteredShopsInPickupProvider
                                              .notifier)
                                          .updateFilteredShops(context,
                                              groupId: null);
                                    },
                                    isSelected:
                                        groupsState.activeGroupIndex == index,
                                  )
                                : ShopGroupItem(
                                    title: groupsState
                                        .groups[index - 1].translation?.title,
                                    onTap: () {
                                      groupsNotifier.setActiveIndex(index);
                                      ref
                                          .read(filteredShopsInPickupProvider
                                              .notifier)
                                          .updateFilteredShops(context,
                                              groupId: groupsState
                                                  .groups[index - 1].id);
                                    },
                                    isSelected:
                                        groupsState.activeGroupIndex == index,
                                  );
                          },
                        ),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final filteredShopsInDeliveryState =
                    ref.watch(filteredShopsInPickupProvider);
                final filteredShopsInDeliveryNotifier =
                    ref.read(filteredShopsInPickupProvider.notifier);
                return AllShopsBody(
                  fromDelivery: false,
                  isLoading:
                      filteredShopsInDeliveryState.isFilteredShopsLoading,
                  shops: filteredShopsInDeliveryState.filteredShops,
                  isMoreLoading:
                      filteredShopsInDeliveryState.isMoreShopsLoading,
                  hasMoreShops: filteredShopsInDeliveryState.hasMoreShops,
                  onMoreTap: () =>
                      filteredShopsInDeliveryNotifier.fetchFilteredShops(
                    checkYourNetwork: () {
                      AppHelpers.showCheckFlash(
                        context,
                        AppHelpers.getTranslation(
                            TrKeys.checkYourNetworkConnection),
                      );
                    },
                  ),
                );
              },
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
