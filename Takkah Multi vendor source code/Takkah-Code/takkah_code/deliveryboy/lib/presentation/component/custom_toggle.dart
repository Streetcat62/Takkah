import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../styles/style.dart';
import '../../infrastructure/services/services.dart';

class CustomToggle extends StatefulWidget {
  final bool isOnline;
  final ValueChanged<bool> onChange;

  const CustomToggle({
    Key? key,
    required this.isOnline,
    required this.onChange,
  }) : super(key: key);

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  var controller = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    controller = ValueNotifier<bool>(widget.isOnline);
    controller.addListener(() => widget.onChange(controller.value));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: controller,
      activeColor: Style.primaryColor,
      inactiveColor: Style.toggleColor,
      borderRadius: BorderRadius.circular(10.r),
      width: 70.w,
      height: 32.w,
      enabled: true,
      disabledOpacity: 0.5,
      thumb: Container(
        margin: REdgeInsets.all(2),
        padding: REdgeInsets.symmetric(vertical: 6),
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
        child: Row(
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
        AppHelpers.getTranslation(TrKeys.active),
        style: Style.interNormal(
          size: 10.sp,
          letterSpacing: -0.3,
          color: widget.isOnline ? Style.white : Style.blackColor,
        ),
      ),
      inactiveChild: Text(
        AppHelpers.getTranslation(TrKeys.inactive),
        style: Style.interNormal(
          size: 10.sp,
          letterSpacing: -0.3,
          color: Style.blackColor,
        ),
      ),
    );
  }
}
