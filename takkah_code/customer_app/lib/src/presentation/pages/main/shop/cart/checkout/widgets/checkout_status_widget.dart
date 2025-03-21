import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'checkout_status_dash.dart';
import 'checkout_status_icon.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../../../core/utils/utils.dart';
import '../riverpod/provider/checkout_provider.dart';
import '../../../../../../../core/constants/constants.dart';

class CheckoutStatusWidget extends StatelessWidget {
  final Function(int) onPageChangeTap;

  const CheckoutStatusWidget({Key? key, required this.onPageChangeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.mainAppbarBack(),
      ),
      padding: REdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(checkoutProvider);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text:
                      '${AppHelpers.getTranslation(TrKeys.completeYourOrder)} — ',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    letterSpacing: -0.4,
                    color: AppColors.iconAndTextColor(),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${(((state.activeTab + 1) / 3) * 100).toInt()}%',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        letterSpacing: -0.4,
                        color: AppColors.iconAndTextColor(),
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 18.r,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: state.activeTab == 2
                          ? AppColors.green
                          : AppColors.secondaryBack(),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CheckoutStatusIcon(
                        iconData: FlutterRemix.map_pin_2_fill,
                        circleColor: state.activeTab == 2
                            ? AppColors.green
                            : AppColors.profileCompleted,
                        iconColor: AppColors.white,
                        onTap: () {
                          onPageChangeTap(0);
                        },
                      ),
                      CheckoutStatusDash(
                        color: state.activeTab == 0
                            ? AppColors.unratedIcon()
                            : (state.activeTab == 2
                                ? AppColors.darkGreen
                                : AppColors.profileCompleted),
                      ),
                      CheckoutStatusIcon(
                        iconData: FlutterRemix.wallet_3_fill,
                        circleColor: state.activeTab == 0
                            ? AppColors.secondaryBack()
                            : (state.activeTab == 2
                                ? AppColors.green
                                : AppColors.profileCompleted),
                        iconColor: state.activeTab == 0
                            ? AppColors.unratedIcon()
                            : AppColors.white,
                        onTap: () {
                          onPageChangeTap(1);
                        },
                      ),
                      CheckoutStatusDash(
                        color: state.activeTab == 2
                            ? AppColors.darkGreen
                            : AppColors.unratedIcon(),
                      ),
                      CheckoutStatusIcon(
                        iconData: FlutterRemix.shield_check_fill,
                        circleColor: state.activeTab < 2
                            ? AppColors.secondaryBack()
                            : AppColors.green,
                        iconColor: state.activeTab == 2
                            ? AppColors.white
                            : AppColors.unratedIcon(),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.shipping),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      letterSpacing: -0.4,
                      color: AppColors.iconAndTextColor(),
                    ),
                  ),
                  Text(
                    AppHelpers.getTranslation(TrKeys.payment),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      letterSpacing: -0.4,
                      color: AppColors.iconAndTextColor(),
                    ),
                  ),
                  Text(
                    AppHelpers.getTranslation(TrKeys.verify),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      letterSpacing: -0.4,
                      color: AppColors.iconAndTextColor(),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
