import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../theme/theme.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../components/components.dart';

class IngredientItem extends StatelessWidget {
  final RecipeProduct? product;

  const IngredientItem({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SmallDot(
            color: AppColors.iconAndTextColor().withOpacity(0.5),
          ),
          4.horizontalSpace,
          Expanded(
            child: Text(
              '${product?.product?.product?.translation?.title}',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: AppColors.iconAndTextColor(),
                letterSpacing: -0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
