import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';

class HorizontalRecipeCategoryItem extends StatelessWidget {
  final RecipeCategoryData recipeCategoryData;
  final int? shopId;

  const HorizontalRecipeCategoryItem({
    Key? key,
    required this.recipeCategoryData,
    this.shopId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.mainAppbarBack(),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: () => context.pushRoute(
              RecipeCategoryRoute(
                categoryData: recipeCategoryData,
                shopId: shopId,
              ),
            ),
            child: Container(
              height: 80.r,
              width: 200.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: REdgeInsets.all(16),
              alignment: Alignment.center,
              child: Row(
                children: [
                  CommonImage(
                    imageUrl: recipeCategoryData.image,
                    width: 50,
                    height: 50,
                    radius: 25,
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${recipeCategoryData.translation?.title}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -14 * 0.02,
                            color: AppColors.iconAndTextColor(),
                          ),
                        ),
                        Text(
                          '${recipeCategoryData.recipesCount} ${AppHelpers.getTranslation(TrKeys.recipes)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -14 * 0.02,
                            color: AppColors.iconAndTextColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        8.horizontalSpace,
      ],
    );
  }
}
