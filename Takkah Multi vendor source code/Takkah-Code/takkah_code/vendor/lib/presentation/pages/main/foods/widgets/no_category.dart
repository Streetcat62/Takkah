import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../infrastructure/services/app_assets.dart';
import '../../../../../infrastructure/services/app_helpers.dart';
import '../../../../../infrastructure/services/tr_keys.dart';
import '../../../../styles/style.dart';

class NoCategory extends StatelessWidget {
  const NoCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(
          AppAssets.noData,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Text(
            AppHelpers.trans(TrKeys.noDataCategory),
            textAlign: TextAlign.center,
            style: Style.interBold(),
          ),
        )
      ],
    );
    
  }
}
