import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../theme/theme.dart';
import '../../../../../../../../models/models.dart';

class InstructionItem extends StatelessWidget {
  final int index;
  final Instructions? instructions;

  const InstructionItem({Key? key, required this.index, this.instructions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${index + 1}.',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: AppColors.iconAndTextColor(),
            letterSpacing: -0.4,
          ),
        ),
        14.horizontalSpace,
        Expanded(
          child: Text(
            '${instructions?.translation?.title}',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: AppColors.iconAndTextColor(),
              letterSpacing: -0.4,
            ),
          ),
        ),
      ],
    );
  }
}
