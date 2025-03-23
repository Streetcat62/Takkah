import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'make_shimmer.dart';
import '../../theme/theme.dart';

class HorizontalBrandsShimmer extends StatelessWidget {
  const HorizontalBrandsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.r,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 18,
        physics: const BouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return MakeShimmer(
            child: Container(
              width: 120.r,
              height: 120.r,
              margin: EdgeInsetsDirectional.only(end: 12.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.mainAppbarBack(),
              ),
            ),
          );
        },
      ),
    );
  }
}
