import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';

class Loading extends StatelessWidget {
  final int width;

  const Loading({Key? key, this.width = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? SizedBox(
              height: width.r,
              width: width.r,
              child: CircularProgressIndicator(
                color: Style.blackColor,
                strokeWidth: 3.r,
              ),
            )
          : const CupertinoActivityIndicator(radius: 12),
    );
  }
}
