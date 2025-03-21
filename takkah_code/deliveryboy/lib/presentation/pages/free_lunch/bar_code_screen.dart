import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../infrastructure/models/models.dart';
import '../../styles/style.dart';
import '../../component/components.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

class BarCodeScreen extends StatelessWidget {
  const BarCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const RestaurantItem(
            shopName: "Evos",
            shopImage:
                "https://dostavkainfo.uz/wp-content/uploads/2020/03/evos.png",
            shopText: "Combo #1",
            shopUid: "0",
            shopId: "0",
          ),
          16.verticalSpace,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Style.shimmerBase),
            ),
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                const Icon(
                  FlutterRemix.error_warning_fill,
                  color: Style.blueColor,
                ),
                12.horizontalSpace,
                RichText(
                  text: TextSpan(
                    text: AppHelpers.getTranslation(TrKeys.youWillShow),
                    style: Style.interRegular(size: 14.sp, letterSpacing: -0.3),
                    children: [
                      TextSpan(
                        text: AppHelpers.getTranslation(TrKeys.qrcode),
                        style:
                            Style.interSemi(size: 14.sp, letterSpacing: -0.3),
                      ),
                      TextSpan(
                        text: AppHelpers.getTranslation(TrKeys.toTheRestaurant),
                        style: Style.interRegular(
                            size: 14.sp, letterSpacing: -0.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          24.verticalSpace,
          Image.asset(AppAssets.pngQr),
          24.verticalSpace,
          Consumer(
            builder: (context, ref, child) {
              return CustomButton(
                title: AppHelpers.getTranslation(TrKeys.showOnMap),
                icon: const Icon(
                  FlutterRemix.map_pin_range_fill,
                  color: Style.blackColor,
                ),
                onPressed: ()  {
                   ref
                      .read(homeProvider.notifier)
                      .getRoutingAll(context, order: OrderDetailData());
                },
              );
            },
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
