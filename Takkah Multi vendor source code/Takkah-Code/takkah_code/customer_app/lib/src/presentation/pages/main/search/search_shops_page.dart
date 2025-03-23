import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../riverpod/provider/main_shop_search_provider.dart';
import '../riverpod/provider/main_product_search_provider.dart';

class SearchShopsPage extends ConsumerWidget {
  const SearchShopsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchShopsProductsBody(
      fromDelivery: true,
      isShopsLoading: ref.watch(mainShopSearchProvider).isLoading,
      isProductsLoading: ref.watch(mainProductSearchProvider).isLoading,
      shops: ref.watch(mainShopSearchProvider).shops,
      products: ref.watch(mainProductSearchProvider).products,
      onLikeTap: (shopId, productId) => ref
          .read(mainProductSearchProvider.notifier)
          .likeOrUnlikeProduct(productId: productId, shopId: shopId),
    );
  }
}
