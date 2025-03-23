
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../details/riverpod/provider/shop_details_provider.dart';
import 'delivery_type_item.dart';
import 'select_delivery_type_button.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../riverpod/provider/checkout_cart_provider.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../riverpod/provider/checkout_deliveries_provider.dart';
import '../../../../saved_locations/riverpod/provider/saved_locations_provider.dart';

class SelectDeliveriesBody extends StatelessWidget {
  const SelectDeliveriesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(checkoutDeliveriesProvider);
        final stateShop = ref.watch(shopDetailsProvider);
        final notifier = ref.read(checkoutDeliveriesProvider.notifier);
        final checkoutCartNotifier = ref.read(checkoutCartProvider.notifier);
        return state.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3.r,
                  color: AppColors.green,
                ),
              )
            : (state.shopDeliveries.isEmpty
                ? Text(
                    AppHelpers.getTranslation(TrKeys.thereIsNoDeliveryType),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      letterSpacing: -0.4,
                      color: AppColors.iconAndTextColor(),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SelectDeliveryTypeButton(
                              isSelected: !state.isPickup,
                              iconData: FlutterRemix.takeaway_fill,
                              title: AppHelpers.getTranslation(TrKeys.delivery),
                              onTap:
                                  AppHelpers.getDeliveries(state.shopDeliveries)
                                          .isEmpty
                                      ? null
                                      : () {
                                          notifier.setIsPickup(false);
                                          checkoutCartNotifier.setDeliveryFee(
                                            state
                                                .shopDeliveries[state
                                                    .selectedDeliveryTypeIndex]
                                                .price,
                                          );
                                        },
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: SelectDeliveryTypeButton(
                              isSelected: state.isPickup,
                              iconData: FlutterRemix.shopping_bag_3_fill,
                              title: AppHelpers.getTranslation(TrKeys.pickup),
                              onTap: AppHelpers.hasPickup(state.shopDeliveries)
                                  ? () {
                                      notifier.setIsPickup(true);
                                      checkoutCartNotifier.setDeliveryFee(0);
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      state.isPickup
                          ? Column(
                              children: [
                                30.verticalSpace,
                                SelectDateButton(
                                  label: AppHelpers.getTranslation(
                                      TrKeys.pickupDate),
                                  time: state.pickupDate == null
                                      ? AppHelpers.getTranslation(
                                          TrKeys.selectPickupDate)
                                      : DateFormat('dd-MMMM HH:mm')
                                          .format(state.pickupDate!),
                                  onChangeTap: () {
                                    AppHelpers.showCustomModalBottomSheet(
                                      context: context,
                                      modal: TimePickerModal(
                                          isValid: notifier.checkDeliveryTime,
                                          onSaved: notifier.setPickupDate,
                                          openTime: AppHelpers.checkWorkDate(stateShop.shopData?.shopWorkingDay).substring(0,5),
                                          closeTime: AppHelpers.checkWorkDate(stateShop.shopData?.shopWorkingDay).substring(8,13)
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                30.verticalSpace,
                                Divider(
                                  thickness: 1.r,
                                  height: 1.r,
                                  color: AppColors.unrated,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: AppHelpers.getDeliveries(
                                          state.shopDeliveries)
                                      .length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return DeliveryTypeItem(
                                      delivery: AppHelpers.getDeliveries(
                                          state.shopDeliveries)[index],
                                      isSelected:
                                          state.selectedDeliveryTypeIndex ==
                                              index,
                                      onTap: () {
                                        notifier.setSelectedDeliveryTypeIndex(
                                            index);
                                        checkoutCartNotifier.setDeliveryFee(
                                          AppHelpers.getDeliveries(
                                                  state.shopDeliveries)[index]
                                              .price,
                                        );
                                      },
                                    );
                                  },
                                ),
                                38.verticalSpace,
                                GestureDetector(
                                  onTap: () => context
                                      .pushRoute(const SavedLocationsRoute()),
                                  child: Text(
                                    AppHelpers.getTranslation(TrKeys.edit),
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: AppColors.blue,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                ),
                                6.verticalSpace,
                                Consumer(
                                  builder: (context, ref, child) {
                                    ref.watch(savedLocationsProvider);
                                    return ProfileEditFieldButton(
                                      onTap: () {},
                                      label: AppHelpers.getTranslation(
                                          TrKeys.deliveryAddress),
                                      hintText:
                                          AppHelpers.getActiveLocalAddress()
                                              ?.title,
                                    );
                                  },
                                ),
                                30.verticalSpace,
                                SelectDateButton(
                                  label: AppHelpers.getTranslation(
                                      TrKeys.deliveryTime),
                                  time: state.deliveryTime == null
                                      ? null
                                      : DateFormat('dd-MMMM HH:mm')
                                          .format(state.deliveryTime!),
                                  onChangeTap: () {
                                    AppHelpers.showCustomModalBottomSheet(
                                      context: context,
                                      modal: TimePickerModal(
                                        isValid: notifier.checkDeliveryTime,
                                        onSaved: notifier.setDeliveryTime,
                                        openTime: AppHelpers.checkWorkDate(stateShop.shopData?.shopWorkingDay).substring(0,5),
                                        closeTime: AppHelpers.checkWorkDate(stateShop.shopData?.shopWorkingDay).substring(8,13)
                                      ),
                                    );
                                  },
                                ),
                                110.verticalSpace,
                              ],
                            ),
                    ],
                  ));
      },
    );
  }
}
