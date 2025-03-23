import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class SearchProductsBody extends StatelessWidget {
  final bool isSearchLoading;
  final List<ProductData> searchedProducts;
  final ValueSetter<int?> onLikeProduct;
  final int? shopId;
  final ValueSetter<ProductData> onIncrease;
  final ValueSetter<ProductData> onDecrease;

  const SearchProductsBody({
    Key? key,
    required this.isSearchLoading,
    required this.searchedProducts,
    required this.onLikeProduct,
    this.shopId,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSearchLoading
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.r),
                child: Text(
                  AppHelpers.getTranslation(TrKeys.searchResults),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: AppColors.iconAndTextColor(),
                    letterSpacing: -1,
                  ),
                ),
              ),
              16.verticalSpace,
              const HorizontalListShimmer(horizontalPadding: 16),
            ],
          )
        : searchedProducts.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.r),
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.searchResults),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: AppColors.iconAndTextColor(),
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  16.verticalSpace,
                  SizedBox(
                    height: 320.r,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: searchedProducts.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => HorizontalProductItem(
                        product: searchedProducts[index],
                        shopId: shopId,
                        onLikePressed: () {
                          onLikeProduct(searchedProducts[index].id);
                        },
                        onIncrease: () {
                          onIncrease(searchedProducts[index]);
                        },
                        onDecrease: () {
                          onDecrease(searchedProducts[index]);
                        },
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  children: [
                    Container(
                      width: 168.r,
                      height: 168.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.secondaryBack(),
                      ),
                      margin: REdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppAssets.pngNoSearchResult,
                        width: 79.r,
                        height: 144.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                    14.verticalSpace,
                    Text(
                      AppHelpers.getTranslation(TrKeys.noSearchResults),
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -14 * 0.02,
                        color: AppColors.iconAndTextColor(),
                      ),
                    ),
                  ],
                ),
              );
  }
}
