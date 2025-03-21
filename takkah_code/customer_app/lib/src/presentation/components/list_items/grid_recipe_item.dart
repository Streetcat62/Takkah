import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../small_dot.dart';
import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';

class GridRecipeItem extends StatelessWidget {
  final int? shopId;
  final RecipeData recipe;

  const GridRecipeItem({Key? key, required this.recipe, this.shopId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(
        RecipeDetailsRoute(recipe: recipe, shopId: shopId),
      ),
      child: Container(
        height: 330.r,
        width: 188.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.mainAppbarBack(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
              child: Hero(
                tag: '${AppConstants.tagHeroRecipeImage}${recipe.id}',
                child: CommonImage(
                  imageUrl: recipe.image,
                  height: 151,
                  width: double.infinity,
                  radius: 0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${recipe.translation?.title}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.iconAndTextColor(),
                        letterSpacing: -14 * 0.02,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          height: 1.r,
                          thickness: 1.r,
                          color: AppColors.recipeItemShadow,
                        ),
                        8.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              FlutterRemix.time_fill,
                              size: 18.r,
                              color: AppColors.green,
                            ),
                            Text(
                              '${recipe.totalTime} min',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.green,
                                letterSpacing: -14 * 0.02,
                              ),
                            ),
                            const SmallDot(),
                            Icon(
                              FlutterRemix.restaurant_fill,
                              size: 18.r,
                              color: AppColors.green,
                            ),
                            Text(
                              '${recipe.calories} kkal',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.green,
                                letterSpacing: -14 * 0.02,
                              ),
                            ),
                          ],
                        ),
                        8.verticalSpace,
                        Divider(
                          height: 1.r,
                          thickness: 1.r,
                          color: AppColors.recipeItemShadow,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CommonImage(
                          imageUrl: recipe.user?.img,
                          height: 30,
                          width: 30,
                          radius: 15,
                        ),
                        8.horizontalSpace,
                        Expanded(
                          child: Text(
                            '${recipe.user?.firstname} ${recipe.user?.lastname}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -14 * 0.02,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
