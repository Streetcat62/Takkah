import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/utils.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback? onSubmit;
  final bool isLoading;

  const GoogleButton({Key? key, this.onSubmit, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      width: (Platform.isIOS ? 36 : 40).r,
      height: (Platform.isIOS ? 36 : 40).r,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color.fromRGBO(37, 48, 63, 1) : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextButton(
        onPressed: onSubmit,
        child: isLoading
            ? const CupertinoActivityIndicator()
            : Icon(
                FlutterRemix.google_line,
                size: 24.r,
                color: isDarkMode
                    ? const Color.fromRGBO(130, 139, 150, 1)
                    : const Color.fromRGBO(136, 136, 126, 1),
              ),
      ),
    );
  }
}
