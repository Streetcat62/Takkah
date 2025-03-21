import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:venderfoodyman/infrastructure/services/services.dart';

import '../styles/style.dart';

class CustomToggle extends StatefulWidget {
  final ValueNotifier<bool>? controller;
  final bool isText;
  final Function(bool?)? onChange;

  const CustomToggle(
      {Key? key, this.controller, this.onChange, this.isText = false})
      : super(key: key);

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  @override
  void initState() {
    widget.controller?.addListener(
      () {
        if (widget.onChange != null) {
          widget.onChange!(widget.controller?.value);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: widget.controller,
      activeColor: Style.primaryColor,
      inactiveColor: Style.toggleColor,
      borderRadius: BorderRadius.circular(10.r),
      width: 70.w,
      height: 30.h,
      enabled: true,
      disabledOpacity: 0.5,
      activeChild: widget.isText
          ? Padding(
              padding: REdgeInsets.only(left: 4.r),
              child: Text(
                AppHelpers.trans(TrKeys.open),
                style: Style.interNormal(size: 12.sp),
              ),
            )
          : const SizedBox.shrink(),
      inactiveChild: widget.isText
          ? Padding(
              padding: REdgeInsets.only(right: 4.r),
              child: Text(
                AppHelpers.trans(TrKeys.close),
                style: Style.interNormal(size: 12.sp),
              ),
            )
          : const SizedBox.shrink(),
      thumb: Container(
        margin: REdgeInsets.all(3),
        padding: REdgeInsets.symmetric(vertical: 7, horizontal: 9),
        decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: Style.toggleShadowColor.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          decoration: const BoxDecoration(color: Style.toggleColor),
        ),
      ),
    );
  }
}
