import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../../infrastructure/services/services.dart';

class TabBarLoading extends StatelessWidget {
  final int itemCount;

  const TabBarLoading({Key? key, this.itemCount = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.r,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount + 1,
        itemBuilder: (context, index) {
          return index == 0
              ? Padding(
                  padding: EdgeInsetsDirectional.only(start: 16.r, end: 8.r),
                  child: SvgPicture.asset(
                    AppAssets.svgMenu,
                    width: 22.r,
                    height: 22.r,
                  ),
                )
              : Container(
                  width: 84.r,
                  decoration: BoxDecoration(
                    color: Style.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Style.white.withOpacity(0.07),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: REdgeInsets.symmetric(horizontal: 18),
                  margin: REdgeInsets.only(right: 9),
                );
        },
      ),
    );
  }
}
