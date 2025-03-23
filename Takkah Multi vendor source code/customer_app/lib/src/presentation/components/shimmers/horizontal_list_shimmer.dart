import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class HorizontalListShimmer extends StatelessWidget {
  final int height;
  final int spacing;
  final double itemWidth;
  final int itemBorderRadius;
  final int horizontalPadding;

  const HorizontalListShimmer({
    Key? key,
    this.height = 256,
    this.spacing = 10,
    this.itemWidth = 170,
    this.itemBorderRadius = 10,
    this.horizontalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: horizontalPadding.r),
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: AppColors.mainShimmerBase(),
                highlightColor: AppColors.mainShimmerHighlight(),
                child: Container(
                  width: itemWidth.r,
                  height: height.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(itemBorderRadius.r),
                    color: AppColors.mainBackground(),
                  ),
                ),
              ),
              spacing.horizontalSpace,
            ],
          );
        },
      ),
    );
  }
}
