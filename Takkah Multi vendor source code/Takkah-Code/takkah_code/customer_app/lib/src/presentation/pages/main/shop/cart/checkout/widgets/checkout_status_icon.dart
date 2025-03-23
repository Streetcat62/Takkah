import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutStatusIcon extends StatelessWidget {
  final IconData iconData;
  final Color circleColor;
  final Color iconColor;
  final VoidCallback onTap;

  const CheckoutStatusIcon({
    Key? key,
    required this.iconData,
    required this.circleColor,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.r,
        height: 36.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: circleColor,
        ),
        alignment: Alignment.center,
        child: Icon(
          iconData,
          size: 18.r,
          color: iconColor,
        ),
      ),
    );
  }
}
