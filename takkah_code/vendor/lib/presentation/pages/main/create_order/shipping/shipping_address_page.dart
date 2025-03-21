import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../styles/style.dart';
import 'widgets/delivery_type_item.dart';
import '../../../../component/components.dart';
import '../../../../routes/app_router.gr.dart';
import '../../../../../application/providers.dart';
import '../../../../../infrastructure/services/services.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({Key? key}) : super(key: key);

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Style.greyColor,
        body: Container(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Style.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: REdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    children: [
                      24.verticalSpace,
                      TitleAndIcon(
                        title: AppHelpers.trans(TrKeys.customerInformation),
                      ),
                      24.verticalSpace,
                      Consumer(
                        builder: (context, ref, child) {
                          final userState = ref.watch(orderUserProvider);
                          return UnderlinedTextField(
                            label: userState.selectedUser != null
                                ? AppHelpers.trans(TrKeys.selectedUser)
                                : AppHelpers.trans(TrKeys.pleaseSelectAUser),
                            readOnly: true,
                            onTap: () =>
                                context.pushRoute(const SelectUserRoute()),
                            textController: userState.userTextController,
                            descriptionText: userState.selectedUser == null
                                ? null
                                : '${userState.selectedUser?.email}',
                          );
                        },
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Style.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  padding: REdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final userState = ref.watch(orderUserProvider);

                      final addressEvent =
                          ref.read(orderAddressProvider.notifier);
                      final addressState = ref.watch(orderAddressProvider);
                      return Column(
                        children: [
                          TitleAndIcon(
                            title: AppHelpers.trans(TrKeys.shippingAddress),
                          ),
                          24.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: Form(
                                  key: _formKey,
                                  child: UnderlinedTextField(
                                    isWarning: userState.selectedUser != null
                                        ? false
                                        : true,
                                    onTap: () => userState.selectedUser != null
                                        ? context.pushRoute(
                                            const SelectAddressFromListRoute())
                                        : const SizedBox.shrink(),
                                    readOnly: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppHelpers.trans(
                                            TrKeys.enterAddress);
                                      }
                                      return null;
                                    },
                                    label: AppHelpers.trans(
                                        userState.selectedUser != null
                                            ? TrKeys.selectedAddress
                                            : TrKeys.pleaseSelectAUser),
                                    textController: addressState.textController,
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              ButtonsBouncingEffect(
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .pushRoute(const SelectAddressRoute());
                                  },
                                  child: Container(
                                    width: 40.r,
                                    height: 40.r,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Style.primaryColor,
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      FlutterRemix.map_pin_add_fill,
                                      size: 24.r,
                                      color: Style.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          24.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: UnderlinedTextField(
                                  label: AppHelpers.trans(TrKeys.entrance),
                                  onChanged: addressEvent.setEntrance,
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: UnderlinedTextField(
                                  label: AppHelpers.trans(TrKeys.floor),
                                  onChanged: addressEvent.setFloor,
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: UnderlinedTextField(
                                  label: AppHelpers.trans(TrKeys.house),
                                  onChanged: addressEvent.setHouse,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                10.verticalSpace,
                Consumer(
                  builder: (context, ref, child) {
                    final deliveryEvent =
                        ref.read(deliveryTypeProvider.notifier);
                    final deliveryState = ref.watch(deliveryTypeProvider);
                    return Container(
                      decoration: BoxDecoration(
                        color: Style.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: REdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          TitleAndIcon(
                            title: AppHelpers.trans(TrKeys.deliveryType),
                          ),
                          24.verticalSpace,
                          DeliveryTypeItem(
                            iconData: FlutterRemix.takeaway_fill,
                            title: AppHelpers.trans(TrKeys.deliveryService),
                            desc:
                                '${AppHelpers.trans(TrKeys.estimatedTime)} 25 - 30 min',
                            isActive:
                                deliveryState.type == DeliveryType.delivery,
                            onTap: () =>
                                deliveryEvent.setType(DeliveryType.delivery),
                          ),
                          8.verticalSpace,
                          DeliveryTypeItem(
                            iconData: FlutterRemix.walk_fill,
                            title: AppHelpers.trans(TrKeys.takeAway),
                            desc:
                                '${AppHelpers.trans(TrKeys.approximateTime)} 25 - 30 min',
                            isActive: deliveryState.type == DeliveryType.pickup,
                            onTap: () =>
                                deliveryEvent.setType(DeliveryType.pickup),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: REdgeInsets.all(16),
          child: Consumer(
            builder: (context, ref, child) => Row(
              children: [
                const PopButton(heroTag: AppConstants.heroTagAddOrderButton),
                8.horizontalSpace,
                if (ref.watch(orderUserProvider).selectedUser != null)
                  Expanded(
                    child: CustomButton(
                      title: AppHelpers.trans(TrKeys.next),
                      onPressed: () {
                        if (ref.watch(deliveryTypeProvider).type ==
                                DeliveryType.delivery &&
                            _formKey.currentState!.validate()) {
                          _formKey.currentState!.deactivate();
                          return context.pushRoute(const DeliveryTimeRoute());
                        } else if (ref.watch(deliveryTypeProvider).type ==
                            DeliveryType.pickup) {
                          return context.pushRoute(const DeliveryTimeRoute());
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
