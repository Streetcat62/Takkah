import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'make_shimmer.dart';
import '../../theme/theme.dart';

class GridListShimmer extends StatelessWidget {
  final int itemCount;
  final int verticalPadding;
  final int? onlyBottomPadding;
  final bool isScrollable;

  const GridListShimmer({
    Key? key,
    this.itemCount = 6,
    this.verticalPadding = 24,
    this.onlyBottomPadding,
    this.isScrollable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 188 / 283,
        mainAxisSpacing: 8.r,
        crossAxisSpacing: 8.r,
        crossAxisCount: 2,
      ),
      padding: onlyBottomPadding != null
          ? REdgeInsets.only(
              top: verticalPadding.r,
              bottom: onlyBottomPadding!.r,
            )
          : REdgeInsets.symmetric(vertical: verticalPadding.r),
      physics: isScrollable
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return MakeShimmer(
          child: Container(
            width: 170.r,
            height: 283.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.mainAppbarBack(),
            ),
          ),
        );
      },
    );
  }
}
