import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pages.dart';
import '../../../styles/style.dart';
import '../../../../infrastructure/services/services.dart';

class FreeLunchWidget extends StatelessWidget {
  const FreeLunchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppHelpers.showCustomModalBottomSheet(
        paddingTop: MediaQuery.of(context).padding.top,
        context: context,
        modal: const FreeLunchScreen(),
        isDarkMode: false,
      ),
      child: Container(
        height: 176.h,
        width: (MediaQuery.of(context).size.width - 48.w) / 2,
        margin: EdgeInsets.only(left: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Style.primaryColor.withOpacity(0.5),
          image: const DecorationImage(
            image: AssetImage(AppAssets.pngLunch),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, left: 16.w),
          child: Text(
            AppHelpers.getTranslation(TrKeys.freeLunches),
            style: Style.interSemi(size: 14.sp, letterSpacing: -0.3),
          ),
        ),
      ),
    );
  }
}
