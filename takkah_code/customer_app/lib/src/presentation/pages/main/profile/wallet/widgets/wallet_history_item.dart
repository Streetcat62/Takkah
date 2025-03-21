import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';

class WalletHistoryItem extends StatelessWidget {
  final WalletData wallet;

  const WalletHistoryItem({Key? key, required this.wallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.mainAppbarBack(),
      ),
      padding: REdgeInsets.all(10),
      margin: REdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 50.r,
                  height: 50.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.iconBackLight,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    FlutterRemix.wallet_3_fill,
                    size: 20.r,
                    color: AppColors.black,
                  ),
                ),
                13.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${wallet.note}',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.5,
                          color: AppColors.iconAndTextColor(),
                        ),
                      ),
                      6.verticalSpace,
                      Text(
                        '${wallet.status}',
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.4,
                          color: AppColors.iconAndTextColor(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${wallet.type == 'withdraw' ? '-' : '+'}${NumberFormat.currency(symbol: LocalStorage.instance.getSelectedCurrency()?.symbol).format(wallet.price)}',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.5,
                  color: wallet.type == 'withdraw'
                      ? AppColors.red
                      : AppColors.green,
                ),
              ),
              6.verticalSpace,
              Text(
                '${wallet.createdAt?.substring(0, 10)}',
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.4,
                  color: AppColors.secondaryIconTextColor(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
