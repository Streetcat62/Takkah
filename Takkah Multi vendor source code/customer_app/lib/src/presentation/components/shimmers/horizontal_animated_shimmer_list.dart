import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../theme/theme.dart';

class HorizontalAnimatedShimmerList extends StatelessWidget {
  final int horizontalPadding;
  final int itemCount;

  const HorizontalAnimatedShimmerList({
    Key? key,
    this.horizontalPadding = 0,
    this.itemCount = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemCount,
        padding:
            REdgeInsets.symmetric(horizontal: horizontalPadding.toDouble()),
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: Padding(
                padding: REdgeInsets.only(bottom: 8),
                child: Container(
                  width: double.infinity,
                  height: 60.r,
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppColors.mainAppbarShadow(),
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                        spreadRadius: 0,
                      )
                    ],
                    color: AppColors.mainAppbarBack(),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
