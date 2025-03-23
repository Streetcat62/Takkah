import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../styles/style.dart';
import '../../../../routes/app_router.gr.dart';
import '../../../../component/components.dart';
import '../../../../../application/providers.dart';
import '../../../../../infrastructure/services/services.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.greyColor,
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(orderCartProvider);
          final event = ref.read(orderCartProvider.notifier);
          final productsEvent = ref.read(orderProductsProvider.notifier);
          return Column(
            children: [
              CustomAppBar(
                bottomPadding: 16.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShopBorderedAvatar(
                      size: 40,
                      imageSize: 33,
                      borderRadius: 20,
                      imageUrl: LocalStorage.instance.getShop()?.logoImg,
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${LocalStorage.instance.getShop()?.translation?.title}',
                            style: Style.interSemi(size: 18.sp),
                          ),
                          Text(
                            '${LocalStorage.instance.getShop()?.translation?.description}',
                            style: Style.interRegular(
                              size: 12.sp,
                              letterSpacing: -0.3,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: REdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 24,
                  bottom: 16,
                ),
                child: TitleAndIcon(
                  title: AppHelpers.trans(TrKeys.orders),
                  rightTitleColor: Style.redColor,
                  rightTitle: state.products.isEmpty
                      ? null
                      : AppHelpers.trans(TrKeys.clearAllOrders),
                  onRightTap: () {
                    event.clearAll();
                    productsEvent.updateProducts(productStocks: []);
                  },
                ),
              ),
              Expanded(
                child: SlidableAutoCloseBehavior(
                  child: ListView.builder(
                    padding: REdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 68,
                    ),
                    shrinkWrap: true,
                    itemCount: state.products.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => FoodStockItem(
                      productStock: state.products[index],
                      onDelete: () => event.deleteStockFromCart(
                        product: state.products[index],
                        updateProducts: (stocks) =>
                            productsEvent.updateProducts(productStocks: stocks),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: REdgeInsets.all(16),
        child: Consumer(
          builder: (context, ref, child) {
            final cartState = ref.watch(orderCartProvider);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PopButton(heroTag: AppConstants.heroTagAddOrderButton),
                8.horizontalSpace,
                if (cartState.products.isNotEmpty)
                  Expanded(
                    child: CustomButton(
                      title: AppHelpers.trans(TrKeys.next),
                      onPressed: () =>
                          context.pushRoute(const ShippingAddressRoute()),
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
