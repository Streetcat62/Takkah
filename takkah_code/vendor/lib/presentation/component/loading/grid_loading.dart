import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles/style.dart';

class GridLoading extends StatelessWidget {
  const GridLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 110.r,
          maxCrossAxisExtent: 110.r),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              color: Style.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              5.verticalSpace,
              Container(
                height: 50.r,
                width: 50.r,
                decoration: BoxDecoration(
                    color: Style.iconColor,
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              15.verticalSpace,
              Container(
                height: 2.h,
                width: 50.w,
                color: Style.iconColor,
              )
            ],
          ),
        );
      },
    );
  }
}
