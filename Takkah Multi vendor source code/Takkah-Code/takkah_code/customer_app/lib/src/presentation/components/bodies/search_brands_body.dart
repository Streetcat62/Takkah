import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class SearchBrandsBody extends StatelessWidget {
  final bool isSearchLoading;
  final List<BrandData> searchedBrands;
  final int? shopId;

  const SearchBrandsBody({
    Key? key,
    required this.isSearchLoading,
    required this.searchedBrands,
    this.shopId,
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
              const HorizontalBrandsShimmer(),
            ],
          )
        : searchedBrands.isNotEmpty
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
                    height: 120.r,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: searchedBrands.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsetsDirectional.only(end: 12.r),
                        child: BrandItem(
                          brand: searchedBrands[index],
                          shopId: shopId,
                        ),
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
