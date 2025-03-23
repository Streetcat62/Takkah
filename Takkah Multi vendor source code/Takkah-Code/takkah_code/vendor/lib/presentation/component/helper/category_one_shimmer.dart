import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../styles/style.dart';

class CategoryOneShimmer extends StatelessWidget {
  const CategoryOneShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700.h,
      margin: EdgeInsets.only(bottom: 26.r, top: 50.r),
      child: AnimationLimiter(
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 12,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    margin: EdgeInsets.only(
                      bottom: 8.r,top: 10.r
                    ),
                    decoration: BoxDecoration(
                      color: Style.shimmerBase,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
