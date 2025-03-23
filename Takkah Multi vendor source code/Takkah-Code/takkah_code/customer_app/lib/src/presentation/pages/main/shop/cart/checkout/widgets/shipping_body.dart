import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'select_deliveries_body.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/constants/constants.dart';

class ShippingBody extends StatelessWidget {
  const ShippingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainAppbarBack(),
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.verticalSpace,
            Text(
              AppHelpers.getTranslation(TrKeys.deliveryType),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                letterSpacing: -0.4,
                color: AppColors.secondaryIconTextColor(),
              ),
            ),
            14.verticalSpace,
            const SelectDeliveriesBody(),
          ],
        ),
      ),
    );
  }
}
