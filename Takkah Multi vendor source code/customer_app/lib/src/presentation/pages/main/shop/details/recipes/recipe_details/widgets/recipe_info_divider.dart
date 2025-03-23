import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../theme/theme.dart';

class RecipeInfoDivider extends StatelessWidget {
  const RecipeInfoDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.r,
      width: 1.r,
      color: AppColors.iconAndTextColor().withOpacity(0.05),
    );
  }
}
