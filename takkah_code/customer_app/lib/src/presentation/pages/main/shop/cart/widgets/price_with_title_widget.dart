import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';

class PriceWithTitleWidget extends StatelessWidget {
  final String title;
  final num? price;

  const PriceWithTitleWidget({Key? key, required this.title, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: AppColors.iconAndTextColor(),
            letterSpacing: -0.3,
          ),
        ),
        Text(
          NumberFormat.currency(
            symbol: LocalStorage.instance.getSelectedCurrency()?.symbol,
          ).format(price),
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: AppColors.iconAndTextColor(),
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }
}
