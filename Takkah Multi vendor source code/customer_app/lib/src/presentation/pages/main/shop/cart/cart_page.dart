
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../theme/theme.dart';
import 'widgets/cart_total_modal.dart';
import '../../../../../core/utils/utils.dart';
import 'riverpod/provider/cart_provider.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../riverpod/provider/shop_cart_provider.dart';
import '../product/riverpod/provider/product_provider.dart';
import '../details/riverpod/provider/shop_category_products_provider.dart';

class CartPage extends ConsumerStatefulWidget {
  final int? shopId;

  const CartPage({Key? key, this.shopId}) : super(key: key);

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(cartProvider.notifier).fetchCart(
              shopId: widget.shopId,
              updateCart: ref.read(shopCartProvider.notifier).setShopCart,
            );
      },
    );
  }

  @override
  void deactivate() {
    ref.read(cartProvider.notifier).cancelTimer();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.cart),
        onLeadingPressed: context.popRoute,
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return TextButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).clearCart(
                        clearedCart: () {
                          ref
                              .read(shopCartProvider.notifier)
                              .setShopCart(null);
                          ref
                              .read(shopCategoryProductsProvider.notifier)
                              .updateShopCategoryProducts(cartData: null);
                        },
                      );
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    AppColors.red.withOpacity(0.4),
                  ),
                ),
                child: Text(
                  AppHelpers.getTranslation(TrKeys.clearCart),
                  style: GoogleFonts.inter(
                    color: AppColors.red,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.4,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(cartProvider);
          final notifier = ref.read(cartProvider.notifier);
          return state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3.r,
                    color: AppColors.green,
                  ),
                )
              : (AppHelpers.checkProductsCount(state.cartData?.userCarts))
                  ? ListView.builder(
                      itemCount: state.cartData?.userCarts?.length,
                      padding:
                      REdgeInsets.symmetric(horizontal: 16, vertical: 30),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return UserCartItem(
                          cartItem: state.cartData?.userCarts?[index],
                          onIncrease: (productIndex) =>
                              notifier.increaseCartProduct(
                            userIndex: index,
                            productIndex: productIndex,
                            shopId: widget.shopId,
                            updateCart: (data) {
                              ref
                                  .read(shopCartProvider.notifier)
                                  .setShopCart(data);
                              ref
                                  .read(shopCategoryProductsProvider.notifier)
                                  .updateShopCategoryProducts(cartData: data);
                              ref
                                  .read(productProvider.notifier)
                                  .updateProductCartCount(cartData: data);
                            },
                          ),
                          onDecrease: (productIndex) =>
                              notifier.decreaseCartProduct(
                            userIndex: index,
                            productIndex: productIndex,
                            shopId: widget.shopId,
                            updateCart: (data) {
                              ref
                                  .read(shopCartProvider.notifier)
                                  .setShopCart(data);
                              ref
                                  .read(shopCategoryProductsProvider.notifier)
                                  .updateShopCategoryProducts(cartData: data);
                              ref
                                  .read(productProvider.notifier)
                                  .updateProductCartCount(cartData: data);
                            },
                          ),
                          onDelete: (productIndex) =>
                              notifier.deleteCartProduct(
                            userIndex: index,
                            productIndex: productIndex,
                            shopId: widget.shopId,
                            updateCart: (data) {
                              ref
                                  .read(shopCartProvider.notifier)
                                  .setShopCart(data);
                              ref
                                  .read(shopCategoryProductsProvider.notifier)
                                  .updateShopCategoryProducts(cartData: data);
                              ref
                                  .read(productProvider.notifier)
                                  .updateProductCartCount(cartData: data);
                            },
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Lottie.asset(
                        AppAssets.lottieNotFound,
                        width: 300.r,
                        height: 300.r,
                      ),
                    );
        },
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(cartProvider);
          return (AppHelpers.checkProductsCount(state.cartData?.userCarts))
              ? Container(
            height: 126.r,
            color: AppColors.mainAppbarBack(),
            alignment: Alignment.center,
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.totalAmount),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.secondaryIconTextColor(),
                        letterSpacing: -0.4,
                      ),
                    ),
                    6.verticalSpace,
                    Text(
                      NumberFormat.currency(
                        symbol: LocalStorage.instance
                            .getSelectedCurrency()
                            ?.symbol,
                      ).format(state.cartData?.totalPrice ?? 0),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 26.sp,
                        color: AppColors.iconAndTextColor(),
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 180.r,
                  child: MainConfirmButton(
                    title: AppHelpers.getTranslation(TrKeys.checkout),
                    onTap: () => AppHelpers.showCustomModalBottomSheet(
                      context: context,
                      background: AppColors.transparent,
                      radius: 20,
                      paddingTop: 90,
                      modal: CartTotalModal(
                        cartId: state.cartData?.id,
                        shopId: widget.shopId,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
