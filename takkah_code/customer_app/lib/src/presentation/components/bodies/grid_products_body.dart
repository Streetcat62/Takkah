import 'dart:io';

import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/models.dart';
import '../shimmers/grid_list_shimmer.dart';
import '../list_items/grid_product_item.dart';
import '../../../core/constants/constants.dart';

class GridProductsBody extends StatelessWidget {
  final bool isLoading;
  final List<ProductData> products;
  final ValueSetter<int?> onLiked;
  final ScrollController? scrollController;
  final int? shopId;
  final ValueSetter<ProductData> increase;
  final ValueSetter<ProductData> decrease;
  final double? bottomPadding;
  final VoidCallback updateState;

  const GridProductsBody({
    Key? key,
    required this.increase,
    required this.decrease,
    required this.onLiked,
    required this.updateState,
    this.isLoading = false,
    this.products = const [],
    this.scrollController,
    this.shopId,
    this.bottomPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const GridListShimmer(
            isScrollable: true,
            onlyBottomPadding: 100,
            verticalPadding: 24,
          )
        : products.isEmpty
            ? Center(child: Lottie.asset(AppAssets.lottieNotFound))
            : GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: products.length,
                padding:
                    REdgeInsets.only(top: 24, bottom: bottomPadding ?? 100),
                controller: scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio:
                      Platform.isAndroid ? (230 / 310) : (218 / 312),
                  mainAxisSpacing: 8.r,
                  crossAxisSpacing: 8.r,
                  crossAxisCount: 2,
                ),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GridProductItem(
                    updateState: updateState,
                    shopId: shopId,
                    product: products[index],
                    onLikePressed: () {
                      onLiked(products[index].id);
                    },
                    onIncrease: () {
                      increase(products[index]);
                    },
                    onDecrease: () {
                      decrease(products[index]);
                    },
                  );
                },
              );
  }
}
