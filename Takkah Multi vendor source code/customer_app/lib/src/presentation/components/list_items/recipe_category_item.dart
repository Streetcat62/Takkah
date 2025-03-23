import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'grid_recipe_item.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';

class RecipeCategoryItem extends StatelessWidget {
  final RecipeCategoryChild? categoryChild;
  final int? shopId;

  const RecipeCategoryItem({Key? key, this.categoryChild, this.shopId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (categoryChild?.recipes != null &&
            (categoryChild?.recipes!.isNotEmpty ?? false))
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
                      '${categoryChild?.translation?.title}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: AppColors.iconAndTextColor(),
                        letterSpacing: -1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.pushRoute(
                        MoreRecipeCategoryRoute(
                          categoryChild: categoryChild,
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
                height: 330.r,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryChild?.recipes?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (categoryChild?.recipes == null ||
                        categoryChild?.recipes?[index] == null) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: EdgeInsetsDirectional.only(end: 8.r),
                      child: GridRecipeItem(
                        recipe: categoryChild!.recipes![index],
                        shopId: shopId,
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
