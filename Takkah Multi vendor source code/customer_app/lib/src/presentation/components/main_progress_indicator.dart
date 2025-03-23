import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class MainProgressIndicator extends StatelessWidget {
  const MainProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              color: AppColors.green,
              strokeWidth: 3.r,
            )
          : const CupertinoActivityIndicator(
              color: AppColors.green,
              radius: 16,
            ),
    );
  }
}
