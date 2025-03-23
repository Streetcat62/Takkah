import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class RecipeCategoriesBody extends StatelessWidget {
  final bool isLoading;
  final List<RecipeCategoryData> recipeCategories;
  final int? shopId;

  const RecipeCategoriesBody({
    Key? key,
    required this.isLoading,
    required this.recipeCategories,
    this.shopId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const HorizontalListShimmer(
            height: 80,
            spacing: 8,
            itemWidth: 200,
            horizontalPadding: 16,
          )
        : recipeCategories.isNotEmpty
            ? SizedBox(
                height: 80.r,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: recipeCategories.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => HorizontalRecipeCategoryItem(
                    recipeCategoryData: recipeCategories[index],
                    shopId: shopId,
                  ),
                ),
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
