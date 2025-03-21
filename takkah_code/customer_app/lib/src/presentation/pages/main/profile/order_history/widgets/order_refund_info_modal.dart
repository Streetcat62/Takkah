import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/app_helpers.dart';
import '../../../../../../core/utils/local_storage.dart';
import '../../../../../theme/app_colors.dart';
import '../riverpod/provider/refund_orders_provider.dart';

class OrderRefundInfoModal extends ConsumerStatefulWidget {
  final int? orderID;
  const OrderRefundInfoModal({Key? key, required this.orderID})
      : super(key: key);

  @override
  ConsumerState<OrderRefundInfoModal> createState() => _OrderRefundInfoModalState();
}

class _OrderRefundInfoModalState extends ConsumerState<OrderRefundInfoModal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        ref
            .read(refundOrderProvider.notifier)
            .fetchRefundOrder(orderID: widget.orderID);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(refundOrderProvider);
     return  state.isLoadingInfo || state.orderData == null
         ? Container(
           height: 200.r,
           decoration: BoxDecoration(
            color: AppColors.mainAppbarBack(),
          ),
           child: Center(
             child: CircularProgressIndicator(
               strokeWidth: 3.r,
               color: AppColors.green,
             ),
           ),
     )
         : SizedBox(
           height: 200.r,
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisSize: MainAxisSize.min,
               children: [
                 Text( AppHelpers.getTranslation(TrKeys.refundStatus),
                   style: GoogleFonts.inter(
                     fontWeight: FontWeight.w700,
                     fontSize: 16.sp,
                     color: AppColors
                         .iconAndTextColor(),
                     letterSpacing: -0.4,
                   ),
                 ),
                 20.verticalSpace,
                 RichText(
                   text: TextSpan(
                     text: '# ${state.orderData?.data.id}  ',
                     style: GoogleFonts.inter(
                       fontWeight: FontWeight.w500,
                       fontSize: 14.sp,
                       height: 1.5,
                       color: AppColors.secondaryIconTextColor(),
                       letterSpacing: -0.4,
                     ),
                     children: <TextSpan>[
                       TextSpan(
                         text: '${AppHelpers.getTranslation(TrKeys.refundOrder)}\n',
                         style: GoogleFonts.inter(
                           fontWeight: FontWeight.w500,
                           fontSize: 16.sp,
                           color: AppColors.black,
                         ),
                       ),
                       TextSpan(
                         text: '${AppHelpers.getTranslation(TrKeys.refundAmount)} ',
                         style: GoogleFonts.inter(
                           fontWeight: FontWeight.w500,
                           fontSize: 16.sp,
                           color: AppColors.black,
                         ),
                       ),
                       TextSpan(
                         text: "${NumberFormat.currency(
                           symbol: LocalStorage.instance
                               .getSelectedCurrency()
                               ?.symbol,
                         ).format(state.orderData?.data.price)}\n"
                       ),
                       TextSpan(
                         text: '${AppHelpers.getTranslation(TrKeys.status)}: ',
                         style: GoogleFonts.inter(
                           fontWeight: FontWeight.w500,
                           fontSize: 16.sp,
                           color: AppColors.black,
                         ),
                       ),
                       TextSpan(
                         text: "${state.orderData?.data.status}\n"
                       ),
                       TextSpan(
                         text: '${AppHelpers.getTranslation(TrKeys.messageUser)}:\n',
                         style: GoogleFonts.inter(
                           fontWeight: FontWeight.w500,
                           fontSize: 16.sp,
                           color: AppColors.black,
                         ),
                       ),
                       TextSpan(
                         text: "${state.orderData?.data.messageUser}\n"
                       ),
                         TextSpan(
                           text: '${AppHelpers.getTranslation(TrKeys.messageUser)}:\n',
                           style: GoogleFonts.inter(
                             fontWeight: FontWeight.w500,
                             fontSize: 16.sp,
                             color: AppColors.black,
                           ),
                         ),
                       TextSpan(
                           text: state.orderData?.data.messageSeller ?? AppHelpers.getTranslation(TrKeys.noAnswer)
                       ),
                     ],
                   ),
                 ),
        ],
      ),
           ),
         );
  }
}