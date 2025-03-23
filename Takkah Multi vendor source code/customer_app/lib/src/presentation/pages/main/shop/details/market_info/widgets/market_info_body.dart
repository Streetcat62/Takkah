import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../../core/constants/constants.dart';

class MarketInfoBody extends StatelessWidget {
  final ShopData? shop;

  const MarketInfoBody({Key? key, this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            24.verticalSpace,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.mainAppbarBack(),
              ),
              padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  MarketInfoItem(
                    iconData: FlutterRemix.map_pin_2_line,
                    label: AppHelpers.getTranslation(TrKeys.address),
                    title: '${shop?.translation?.address}',
                  ),
                  26.verticalSpace,
                  MarketInfoItem(
                    iconData: FlutterRemix.time_line,
                    label: AppHelpers.getTranslation(TrKeys.workingHours),
                    title: AppHelpers.checkWorkDate(shop?.shopWorkingDay),
                  ),
                  26.verticalSpace,
                  MarketInfoItem(
                    iconData: FlutterRemix.money_dollar_box_line,
                    label: AppHelpers.getTranslation(TrKeys.deliveryFee),
                    title: NumberFormat.currency(
                      symbol: LocalStorage.instance.getSelectedCurrency()?.symbol,
                    ).format(AppHelpers.getDeliveryFee(shop?.deliveries)),
                  ),
                  26.verticalSpace,
                  MarketInfoItem(
                    iconData: FlutterRemix.service_line,
                    label: AppHelpers.getTranslation(TrKeys.deliveryType),
                    title: AppHelpers.getDeliveryTypeText(shop?.deliveries),
                  ),
                  26.verticalSpace,
                  MarketInfoItem(
                    iconData: FlutterRemix.map_pin_range_line,
                    label: AppHelpers.getTranslation(TrKeys.deliveryRange),
                    title: '${shop?.deliveryRange ?? '0' } km',
                  ),
                ],
              ),
            ),
            8.verticalSpace,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.mainAppbarBack(),
              ),
              padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.description),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: AppColors.secondaryIconTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    '${shop?.translation?.description}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
