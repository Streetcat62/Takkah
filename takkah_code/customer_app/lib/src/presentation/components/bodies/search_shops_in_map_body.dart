import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../list_items/shop_item_in_map.dart';
import '../../../core/constants/constants.dart';
import '../shimmers/horizontal_list_shimmer.dart';

class SearchShopsInMapBody extends StatelessWidget {
  final int height;
  final bool isLoading;
  final List<ShopData> shops;
  final bool fromDelivery;

  const SearchShopsInMapBody({
    Key? key,
    this.height = 214,
    this.isLoading = false,
    this.shops = const [],
    required this.fromDelivery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.r,
      child: isLoading
          ? HorizontalListShimmer(
              horizontalPadding: 16,
              height: height,
              spacing: 14,
              itemWidth: 162,
              itemBorderRadius: 15,
            )
          : shops.isNotEmpty
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: shops.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ShopItemInMap(
                    shop: shops[index],
                    fromDelivery: fromDelivery,
                  ),
                )
              : Center(
                  child: Column(
                    children: [
                      Container(
                        width: 120.r,
                        height: 120.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.secondaryBack(),
                        ),
                        margin: REdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppAssets.pngNoSearchResult,
                          width: 50.r,
                          height: 90.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                      14.verticalSpace,
                      Text(
                        AppHelpers.getTranslation(TrKeys.noShops),
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -14 * 0.02,
                          color: AppColors.iconAndTextColor(),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
