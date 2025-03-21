import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/style.dart';

class Loading extends StatelessWidget {
  final Color bgColor;

  const Loading({Key? key, this.bgColor = Style.greyColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              color: Style.greenColor,
              strokeWidth: 5.r,
            )
          :  CupertinoActivityIndicator(radius: 12.r),
    );
  }
}
