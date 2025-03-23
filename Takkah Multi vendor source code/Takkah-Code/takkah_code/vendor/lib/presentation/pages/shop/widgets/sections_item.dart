import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';

class SectionsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SectionsItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        color: Style.transparent,
        child: Row(
          children: [
            Icon(icon),
            16.horizontalSpace,
            Text(
              title,
              style: Style.interRegular(size: 16.sp, color: Style.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
