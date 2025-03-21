import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';
import '../components.dart';

class ProductsBody extends StatelessWidget {
  final RefreshController refreshController;
  final int bottomPadding;
  final bool isLoading;
  final int itemSpacing;
  final List<ProductModel> products;
  final Function(int) onProductTap;
  final Function() onLoading;
  final Function() onRefreshing;
  final bool isOrderFoods;
  final int loadingHeight;
  final ScrollPhysics scrollPhysics;
  final ScrollController? scrollController;
  const ProductsBody({
    Key? key,
    required this.refreshController,
    required this.isLoading,
    required this.products,
    required this.onProductTap,
    required this.onLoading,
    required this.onRefreshing,
    this.itemSpacing = 1,
    this.bottomPadding = 72,
    this.isOrderFoods = false,
    this.loadingHeight = 188,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingList(
            verticalPadding: 16,
            itemBorderRadius: 0,
            itemPadding: itemSpacing,
            itemHeight: loadingHeight,
          )
        : SmartRefresher(
            controller: refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onLoading: onLoading,
            onRefresh: onRefreshing,
            child: AnimationLimiter(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: scrollController,
                padding: REdgeInsets.only(top: 16, bottom: bottomPadding.r),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) => isOrderFoods
                    ? AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          child: OrderFoodItem(
                            index: index,
                            product: products[index],
                            onTap: () => onProductTap(index),
                            spacing: itemSpacing,
                          ),
                        ),
                      )
                    : AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          child: FoodItem(
                            product: products[index],
                            spacing: itemSpacing,
                            onTap: () => onProductTap(index),
                          ),
                        ),
                      ),
              ),
            ),
          );
  }
}
