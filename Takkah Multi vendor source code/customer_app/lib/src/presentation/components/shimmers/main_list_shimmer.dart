import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class MainListShimmer extends StatelessWidget {
  final int itemHeight;
  final int spacing;
  final int borderRadius;
  final int verticalPadding;
  final int itemCount;

  const MainListShimmer({
    Key? key,
    this.itemHeight = 55,
    this.spacing = 1,
    this.borderRadius = 0,
    this.verticalPadding = 0,
    this.itemCount = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      physics: const BouncingScrollPhysics(),
      padding: REdgeInsets.symmetric(vertical: verticalPadding.r),
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Shimmer.fromColors(
              baseColor: AppColors.mainShimmerBase(),
              highlightColor: AppColors.mainShimmerHighlight(),
              child: Container(
                height: itemHeight.r,
                decoration: BoxDecoration(
                  color: AppColors.mainBackground(),
                  borderRadius: BorderRadius.circular(borderRadius.r),
                ),
              ),
            ),
            spacing.verticalSpace,
          ],
        );
      },
    );
  }
}
