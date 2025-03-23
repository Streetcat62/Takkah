import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';
import '../components.dart';

class ShopCategoryProductsItem extends StatelessWidget {
  final ShopCategoryData shopCategoryData;
  final int? shopId;
  final ValueSetter<int?> onLikeProduct;
  final ValueSetter<int> onIncrease;
  final ValueSetter<int> onDecrease;

  const ShopCategoryProductsItem({
    Key? key,
    required this.shopCategoryData,
    required this.onLikeProduct,
    required this.onIncrease,
    required this.onDecrease,
    this.shopId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (shopCategoryData.products != null &&
            shopCategoryData.products!.isNotEmpty)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${shopCategoryData.translation?.title}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: AppColors.iconAndTextColor(),
                        letterSpacing: -1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.pushRoute(
                        CategoryProductsRoute(
                          category: shopCategoryData,
                          shopId: shopId,
                        ),
                      ),
                      child: Text(
                        AppHelpers.getTranslation(TrKeys.viewMore),
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.blue,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              SizedBox(
                height: 320.r,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: shopCategoryData.products!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => HorizontalProductItem(
                    product: shopCategoryData.products![index],
                    onLikePressed: () {
                      onLikeProduct(shopCategoryData.products![index].id);
                    },
                    onIncrease: () {
                      onIncrease(shopCategoryData.products![index].id ?? 0);
                    },
                    onDecrease: () {
                      onDecrease(shopCategoryData.products![index].id ?? 0);
                    },
                    shopId: shopId,
                  ),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
