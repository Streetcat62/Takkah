import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'make_shimmer.dart';
import '../../theme/theme.dart';

class CircleBrandsShimmer extends StatelessWidget {
  const CircleBrandsShimmer({Key? key}) : super(key: key);

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
        SizedBox(
          height: 120.r,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 14,
            physics: const BouncingScrollPhysics(),
            padding: REdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return MakeShimmer(
                child: Container(
                  width: 120.r,
                  height: 120.r,
                  margin: EdgeInsetsDirectional.only(end: 4.r),
                  decoration: BoxDecoration(
                    color: AppColors.mainBackground(),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
        32.verticalSpace,
      ],
    );
  }
}
