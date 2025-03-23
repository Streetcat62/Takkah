import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../styles/style.dart';
import '../../../../../infrastructure/services/services.dart';

class NoOrders extends StatelessWidget {
  const NoOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.pngNoOrders, width: 205.w, height: 206.h),
          Text(
            AppHelpers.trans(TrKeys.noOrders),
            style: Style.interRegular(
              size: 14.sp,
              color: Style.blackColor,
              letterSpacing: -0.3,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
