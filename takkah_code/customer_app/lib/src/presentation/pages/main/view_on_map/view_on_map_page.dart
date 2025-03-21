import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../theme/theme.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../../core/constants/constants.dart';
import 'riverpod/provider/view_on_map_provider.dart';
import 'riverpod/provider/shop_markers_provider.dart';
import 'riverpod/provider/shops_in_map_provider.dart';
import 'riverpod/provider/search_shop_in_map_provider.dart';
import 'riverpod/provider/shop_groups_in_view_map_provider.dart';

class ViewOnMapPage extends ConsumerStatefulWidget {
  const ViewOnMapPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ViewOnMapPage> createState() => _ViewOnMapPageState();
}

class _ViewOnMapPageState extends ConsumerState<ViewOnMapPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(shopsInMapProvider.notifier).fetchOpenNowShops(
              shopMarkersNotifier: ref.read(shopMarkersProvider.notifier),
            );
        ref
            .read(searchShopInMapProvider.notifier)
            .makeAllShop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer(
          builder: (context, ref, child) {
            final viewOnMapState = ref.watch(viewOnMapProvider);
            final viewOnMapNotifier = ref.read(viewOnMapProvider.notifier);
            return Stack(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    return GoogleMap(
                      tiltGesturesEnabled: false,
                      myLocationButtonEnabled: false,
                      markers: Set<Marker>.of(
                        ref.watch(shopMarkersProvider).markers.values,
                      ),
                      initialCameraPosition: CameraPosition(
                        bearing: 0,
                        target: LatLng(
                          AppHelpers.getInitialLatitude() ??
                              AppConstants.demoLatitude,
                          AppHelpers.getInitialLongitude() ??
                              AppConstants.demoLongitude,
                        ),
                        tilt: 0,
                        zoom: 0,
                      ),
                      onMapCreated: (controller) {
                        controller.setMapStyle(
                          json.encode(AppMapThemes.mapTheme()),
                        );
                      },
                      padding: REdgeInsets.only(
                        bottom: viewOnMapState.isChoosing ? 0 : 382,
                      ),
                      zoomControlsEnabled: false,
                      onCameraMoveStarted: () =>
                          viewOnMapNotifier.setChoosing(true),
                      onCameraIdle: () => viewOnMapNotifier.setChoosing(false),
                      onCameraMove: (cameraPosition) {},
                    );
                  },
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  top: 59.r,
                  left: viewOnMapState.isChoosing ? -60.r : 15.r,
                  child: CircleIconButton(
                    elevation: 2,
                    width: 60,
                    onTap: context.popRoute,
                    iconColor: AppColors.iconAndTextColor(),
                    backgroundColor: AppColors.mainAppbarBack(),
                    iconData: FlutterRemix.arrow_left_s_line,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  bottom: viewOnMapState.isChoosing
                      ? -382.r
                      : MediaQuery.of(context).viewInsets.bottom,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 382.r,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r),
                      ),
                      color: AppColors.mainAppbarBack(),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mainAppbarShadow(),
                          offset: const Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Consumer(
                      builder: (context, ref, child) {
                        final searchShopState =
                            ref.watch(searchShopInMapProvider);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 60.r,
                                height: 5.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: AppColors.gray.withOpacity(0.3),
                                ),
                              ),
                            ),
                            SearchTextField(
                              backgroundColor: AppColors.transparent,
                              hintText: AppHelpers.getTranslation(
                                  TrKeys.searchStores),
                              onChanged: (query) => ref
                                  .read(searchShopInMapProvider.notifier)
                                  .setQuery(context, query),
                            ),
                            Divider(
                              thickness: 1.r,
                              height: 1.r,
                              color: AppColors.gray.withOpacity(0.14),
                            ),
                            20.verticalSpace,
                            searchShopState.isSearching
                                ? SearchShopsInMapBody(
                                    fromDelivery: true,
                                    isLoading: searchShopState.isSearchLoading,
                                    shops: searchShopState.searchedShops,
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Consumer(
                                        builder: (context, ref, child) {
                                          final groupState = ref.watch(
                                              shopGroupsInViewMapProvider);
                                          final groupNotifier = ref.read(
                                              shopGroupsInViewMapProvider
                                                  .notifier);
                                          final shopsNotifier = ref.read(
                                              shopsInMapProvider.notifier);
                                          final shopMarkersNotifier = ref.read(
                                              shopMarkersProvider.notifier);
                                          return SizedBox(
                                            height: 34.r,
                                            child: ListView(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              padding: REdgeInsets.symmetric(
                                                  horizontal: 16),
                                              children: [
                                                ShopGroupItem(
                                                  title:
                                                      AppHelpers.getTranslation(
                                                          TrKeys.openNow),
                                                  onTap: () {
                                                    groupNotifier
                                                        .setActiveIndex(0);
                                                    shopsNotifier
                                                        .fetchOpenNowShops(
                                                      shopMarkersNotifier:
                                                          shopMarkersNotifier,
                                                    );
                                                  },
                                                  isSelected: groupState
                                                          .activeGroupIndex ==
                                                      0,
                                                ),
                                                // ShopGroupItem(
                                                //   title:
                                                //       AppHelpers.getTranslation(
                                                //           TrKeys.nearYou),
                                                //   onTap: () {
                                                //     groupNotifier
                                                //         .setActiveIndex(1);
                                                //     shopsNotifier.fetchNearbyShops(
                                                //         shopMarkersNotifier:
                                                //             shopMarkersNotifier);
                                                //   },
                                                //   isSelected: groupState
                                                //           .activeGroupIndex ==
                                                //       1,
                                                // ),
                                                ShopGroupItem(
                                                  title: '24/7',
                                                  onTap: () {
                                                    groupNotifier
                                                        .setActiveIndex(2);
                                                    shopsNotifier.fetchWork247Shops(
                                                        shopMarkersNotifier:
                                                            shopMarkersNotifier);
                                                  },
                                                  isSelected: groupState
                                                          .activeGroupIndex ==
                                                      2,
                                                ),
                                                ShopGroupItem(
                                                  title:
                                                      AppHelpers.getTranslation(
                                                          TrKeys.newKey),
                                                  onTap: () {
                                                    groupNotifier
                                                        .setActiveIndex(3);
                                                    shopsNotifier.fetchNewShops(
                                                        shopMarkersNotifier:
                                                            shopMarkersNotifier);
                                                  },
                                                  isSelected: groupState
                                                          .activeGroupIndex ==
                                                      3,
                                                ),
                                                ShopGroupItem(
                                                  title:
                                                      AppHelpers.getTranslation(
                                                          TrKeys.pickup),
                                                  onTap: () {
                                                    groupNotifier
                                                        .setActiveIndex(4);
                                                    shopsNotifier.fetchPickupShops(
                                                        shopMarkersNotifier:
                                                            shopMarkersNotifier);
                                                  },
                                                  isSelected: groupState
                                                          .activeGroupIndex ==
                                                      4,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      20.verticalSpace,
                                      Consumer(
                                        builder: (context, ref, child) {
                                          final shopsState =
                                              ref.watch(shopsInMapProvider);
                                          return SearchShopsInMapBody(
                                            fromDelivery: true,
                                            isLoading: shopsState.isLoading,
                                            shops: shopsState.shops,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
