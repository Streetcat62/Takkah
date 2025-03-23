import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';
import '../../core/utils/utils.dart';

class PriceWithTypeWidget extends StatelessWidget {
  final String type;
  final num? price;

  const PriceWithTypeWidget({Key? key, required this.type, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
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
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: AppColors.iconAndTextColor(),
            letterSpacing: -0.4,
          ),
        ),
      ],
    );
  }
}
