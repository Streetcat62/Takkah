import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'make_shimmer.dart';
import '../../theme/theme.dart';
import 'horizontal_list_shimmer.dart';

class RelatedProductsShimmer extends StatelessWidget {
  const RelatedProductsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: MakeShimmer(
            child: Container(
              height: 24.r,
              width: 179.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.mainBackground(),
              ),
            ),
          ),
        ),
        18.verticalSpace,
        const HorizontalListShimmer(horizontalPadding: 16),
        32.verticalSpace,
      ],
    );
  }
}
