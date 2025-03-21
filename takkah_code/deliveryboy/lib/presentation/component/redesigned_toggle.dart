import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../styles/style.dart';
import '../../infrastructure/services/services.dart';

class RedesignedToggle extends StatelessWidget {
  final bool isOnline;
  final bool isOrder;
  final ValueNotifier<bool> controller;
  final bool isLoading;

  const RedesignedToggle({
    Key? key,
    required this.isOnline,
    required this.controller,
    this.isOrder = false,
    this.isLoading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: controller,
      activeColor: Style.primaryColor,
      inactiveColor: Style.toggleColor,
      borderRadius: BorderRadius.circular(10.r),
      width: isOrder ? 70.w : 94.w,
      height: isOrder ? 32.w : 40.h,
      enabled: true,
      disabledOpacity: 0.5,
      thumb: Container(
        margin: EdgeInsets.all(isOrder ? 2.r : 4.r),
        padding: EdgeInsets.symmetric(
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Style.toggleShadowColor.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: isLoading
            ? const CupertinoActivityIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: double.infinity,
                    width: 3.r,
                    color: Style.toggleColor,
                  ),
                  2.horizontalSpace,
                  Container(
                    height: double.infinity,
                    width: 3.r,
                    color: Style.toggleColor,
                  )
                ],
              ),
      ),
      activeChild: Text(
        !isOrder
            ? AppHelpers.getTranslation(TrKeys.online)
            : AppHelpers.getTranslation(TrKeys.active),
        style: Style.interNormal(
          size: isOrder ? 10.sp : 12.sp,
          letterSpacing: -0.3,
          color: isOnline ? Style.white : Style.blackColor,
        ),
      ),
      inactiveChild: Text(
        !isOrder
            ? AppHelpers.getTranslation(TrKeys.offline)
            : AppHelpers.getTranslation(TrKeys.inactive),
        style: Style.interNormal(
          size: isOrder ? 10.sp : 12.sp,
          letterSpacing: -0.3,
          color: Style.blackColor,
        ),
      ),
    );
  }
}
