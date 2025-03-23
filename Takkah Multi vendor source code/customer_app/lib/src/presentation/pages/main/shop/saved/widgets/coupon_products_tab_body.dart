import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/components.dart';
import '../riverpod/provider/coupon_products_provider.dart';

class CouponProductsTabBody extends ConsumerStatefulWidget {
  final int? shopId;

  const CouponProductsTabBody({Key? key, this.shopId}) : super(key: key);

  @override
  ConsumerState<CouponProductsTabBody> createState() =>
      _CouponProductsTabBodyState();
}

class _CouponProductsTabBodyState extends ConsumerState<CouponProductsTabBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(couponProductsProvider.notifier).updateCouponProducts(
              context,
              shopId: widget.shopId,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final productsState = ref.watch(couponProductsProvider);
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: productsState.isLoading
              ? const GridListShimmer(
                  isScrollable: true,
                  onlyBottomPadding: 100,
                  verticalPadding: 24,
                )
              : GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: productsState.couponProducts.length,
                  padding: REdgeInsets.only(top: 24, bottom: 100),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 170 / 283,
                    mainAxisSpacing: 8.r,
                    crossAxisSpacing: 8.r,
                    crossAxisCount: 2,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GridProductItem(
                      updateState: () => ref
                          .read(couponProductsProvider.notifier)
                          .updateState(),
                      shopId: widget.shopId,
                      product: productsState.couponProducts[index],
                      onLikePressed: () => ref
                          .read(couponProductsProvider.notifier)
                          .likeOrUnlikeProduct(
                            productId: productsState.couponProducts[index].id,
                            shopId: widget.shopId,
                          ),
                      onIncrease: () => ref
                          .read(couponProductsProvider.notifier)
                          .increaseProductCount(
                        productId: productsState.couponProducts[index].id,
                        shopId: widget.shopId,
                      ),
                      onDecrease: () => ref
                          .read(couponProductsProvider.notifier)
                          .decreaseProductCount(
                        productId: productsState.couponProducts[index].id,
                        shopId: widget.shopId,
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
