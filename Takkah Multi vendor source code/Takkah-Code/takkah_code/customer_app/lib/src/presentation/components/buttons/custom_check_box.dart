import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/utils.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;

  const CustomCheckBox({Key? key,required this.isChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Icon(
      isChecked
          ? FlutterRemix.checkbox_circle_fill
          : FlutterRemix.checkbox_blank_circle_line,
      size: 24.sp,
      color: isChecked
          ? const Color.fromRGBO(69, 165, 36, 1)
          : isDarkMode
              ? const Color.fromRGBO(255, 255, 255, 1)
              : const Color.fromRGBO(0, 0, 0, 1),
    );
  }
}
