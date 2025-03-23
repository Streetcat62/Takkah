
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';
import 'list_items/vertical_shop_item.dart';
import 'buttons/custom_outlined_button.dart';
import '../../core/constants/constants.dart';

class AllShopsBody extends StatelessWidget {
  final bool isLoading;
  final bool isMoreLoading;
  final bool hasMoreShops;
  final List<ShopData> shops;
  final VoidCallback onMoreTap;
  final bool fromDelivery;

  const AllShopsBody({
    Key? key,
    required this.isLoading,
    required this.isMoreLoading,
    required this.hasMoreShops,
    required this.shops,
    required this.onMoreTap,
    required this.fromDelivery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.green,
                    strokeWidth: 3.r,
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      itemCount: shops.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => VerticalShopItem(
                        shop: shops[index],
                        isLast: shops.length - 1 == index,
                        fromDelivery: fromDelivery,
                      ),
                    ),
                    20.verticalSpace,
                    hasMoreShops
                        ? (isMoreLoading
                            ? Center(
                                child: SizedBox(
                                  width: 20.r,
                                  height: 20.r,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3.r,
                                    color: AppColors.green,
                                  ),
                                ),
                              )
                            : CustomOutlinedButton(
                                onTap: onMoreTap,
                                title:
                                    AppHelpers.getTranslation(TrKeys.viewMore),
                              ))
                        : const SizedBox.shrink(),
                  ],
                ),
        ],
      ),
    );
  }
}
