import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/components.dart';
import '../../riverpod/provider/shop_cart_provider.dart';
import '../riverpod/provider/discount_products_provider.dart';
import '../../riverpod/provider/shop_main_bottom_provider.dart';

class DiscountProductsTabBody extends ConsumerStatefulWidget {
  final int? shopId;

  const DiscountProductsTabBody({Key? key, this.shopId}) : super(key: key);

  @override
  ConsumerState<DiscountProductsTabBody> createState() =>
      _DiscountProductsTabBodyState();
}

class _DiscountProductsTabBodyState
    extends ConsumerState<DiscountProductsTabBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(discountProductsProvider.notifier).fetchDiscountProducts(
                shopId: widget.shopId,
                cartData: ref.watch(shopCartProvider).cartData,
              );
        }
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          ref.read(shopMainBottomProvider.notifier).setVisible(false);
        }
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          ref.read(shopMainBottomProvider.notifier).setVisible(true);
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(discountProductsProvider.notifier).updateDiscountProducts(
              shopId: widget.shopId,
              cartData: ref.watch(shopCartProvider).cartData,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(discountProductsProvider);
        final notifier = ref.read(discountProductsProvider.notifier);
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: GridProductsBody(
            updateState: notifier.updateState,
            isLoading: state.isLoading,
            products: state.discountProducts,
            scrollController: _scrollController,
            shopId: widget.shopId,
            onLiked: (productId) =>
                ref.read(discountProductsProvider.notifier).likeOrUnlikeProduct(
                      productId: productId,
                      shopId: widget.shopId,
                    ),
            increase: (data) {
              notifier.increaseProductCount(
                product: data,
              );
            },
            decrease: (data) {
              notifier.decreaseProductCount(
                product: data,
              );
            },
          ),
        );
      },
    );
  }
}
