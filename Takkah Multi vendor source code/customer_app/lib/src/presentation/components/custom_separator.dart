import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class CustomSeparator extends StatelessWidget {
  final int height;
  final Color? color;

  const CustomSeparator({Key? key, this.height = 1, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 6;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(
            dashCount,
            (_) {
              return SizedBox(
                width: dashWidth.r,
                height: dashHeight.r,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color ?? AppColors.iconAndTextColor(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
