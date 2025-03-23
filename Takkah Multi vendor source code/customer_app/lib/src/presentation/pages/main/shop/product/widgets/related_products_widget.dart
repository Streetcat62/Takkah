import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';
import '../riverpod/provider/related_products_provider.dart';

class RelatedProductsWidget extends StatelessWidget {
  final int? shopId;

  const RelatedProductsWidget({Key? key, this.shopId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(relatedProductsProvider);
        final notifier = ref.read(relatedProductsProvider.notifier);
        return state.isLoading
            ? const RelatedProductsShimmer()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.r),
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.relatedProducts),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: AppColors.iconAndTextColor(),
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  16.verticalSpace,
                  state.relatedProducts.isNotEmpty
                      ? SizedBox(
                          height: 320.r,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: REdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.relatedProducts.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                HorizontalProductItem(
                              product: state.relatedProducts[index],
                              onLikePressed: () {
                                notifier.likeOrUnlikeProduct(
                                  productId: state.relatedProducts[index].id,
                                  shopId: shopId,
                                );
                              },
                              onIncrease: () {
                                notifier.increaseProductCount(index);
                              },
                              onDecrease: () {
                                notifier.decreaseProductCount(index);
                              },
                              shopId: shopId,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              );
      },
    );
  }
}
