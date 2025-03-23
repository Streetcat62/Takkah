import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/style.dart';
import 'helper/common_image.dart';

class DriverAvatar extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String desc;

  const DriverAvatar({
    Key? key,
    required this.name,
    required this.desc,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50.r,
          width: 50.r,
          child: CommonImage(imageUrl: imageUrl, radius: 25),
        ),
        12.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Style.interRegular(size: 14.sp, color: Style.blackColor),
            ),
            4.verticalSpace,
            Text(
              desc,
              style: Style.interNormal(size: 12.sp, color: Style.blackColor),
            )
          ],
        ),
      ],
    );
  }
}
