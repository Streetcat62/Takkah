import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import 'riverpod/provider/viewed_products_provider.dart';
import '../../shop/riverpod/provider/shop_cart_provider.dart';

class ViewedProductsPage extends ConsumerStatefulWidget {
  final int? shopId;

  const ViewedProductsPage({Key? key, this.shopId}) : super(key: key);

  @override
  ConsumerState<ViewedProductsPage> createState() => _ViewedProductsPageState();
}

class _ViewedProductsPageState extends ConsumerState<ViewedProductsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(viewedProductsProvider.notifier).fetchViewedProducts(
              shopId: widget.shopId,
              cartData: ref.watch(shopCartProvider).cartData,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.viewedProducts),
        onLeadingPressed: context.popRoute,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final notifier = ref.read(viewedProductsProvider.notifier);
            final state = ref.watch(viewedProductsProvider);
            return GridProductsBody(
              updateState: notifier.updateState,
              onLiked: (productId) => notifier.likeOrUnlikeProduct(
                productId: productId,
                shopId: widget.shopId,
              ),
              isLoading: state.isLoading,
              products: state.products,
              shopId: widget.shopId,
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
            );
          },
        ),
      ),
    );
  }
}
