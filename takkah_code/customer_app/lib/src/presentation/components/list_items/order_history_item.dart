import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pages/main/profile/order_history/widgets/order_refund_info_modal.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class OrderHistoryItem extends StatelessWidget {
  final OrderData order;
  final VoidCallback onTap;

  const OrderHistoryItem({
    Key? key,
    required this.order,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 8),
      child: Material(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.mainAppbarBack(),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.r),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: REdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.shop),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.secondaryIconTextColor(),
                            letterSpacing: -0.4,
                          ),
                        ),
                        Text(
                          '${order.shop?.translation?.title}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.iconAndTextColor(),
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                   const Spacer(),
                    if(order.refundID != null)
                    IconButton(
                      iconSize: 20,
                      onPressed: (){
                        AppHelpers.showAlertDialog(
                            context: context,
                            child: OrderRefundInfoModal(orderID: order.refundID,));
                      },
                      icon: const  Icon(Icons.remove_red_eye),
                    ),
                    Container(
                      height: 31.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: AppColors.green,
                      ),
                      padding: REdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: '${AppHelpers.getTranslation(TrKeys.order)} - ',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: AppColors.white,
                            letterSpacing: -0.5,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '#${order.id}',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: AppColors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                34.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.date),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.secondaryIconTextColor(),
                            letterSpacing: -0.4,
                          ),
                        ),
                        Text(
                          '${order.createdAt?.substring(0, 16)}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.iconAndTextColor(),
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.orderAmount),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.secondaryIconTextColor(),
                            letterSpacing: -0.4,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(symbol: order.currency?.symbol)
                              .format(order.price ?? 0),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.iconAndTextColor(),
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
