import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? iconData;
  final Function()? onTap;
  final int size;

  const CustomIconButton({
    Key? key,
    required this.iconData,
    this.onTap,
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.r,
        height: size.r,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Style.primaryColor,
        ),
        alignment: Alignment.center,
        child: Icon(
          iconData,
          size: 24.r,
          color: Style.blackColor,
        ),
      ),
    );
  }
}
