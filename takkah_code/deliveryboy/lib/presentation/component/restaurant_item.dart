import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/style.dart';
import 'shop_avatar.dart';

class RestaurantItem extends StatelessWidget {
  final String shopName;
  final String shopUid;
  final String shopImage;
  final String shopText;
  final String shopId;

  const RestaurantItem({
    Key? key,
    required this.shopName,
    required this.shopImage,
    required this.shopText,
    required this.shopUid,
    required this.shopId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        height: 74.h,
        decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Style.white.withOpacity(0.04),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShopAvatar(imageUrl: shopImage, size: 50, padding: 6),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        shopName,
                        style: Style.interSemi(
                          size: 15.sp,
                          color: Style.blackColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width - 220.w),
                        child: Icon(
                          FlutterRemix.building_fill,
                          size: 16.r,
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        "1.3 km",
                        style: Style.interRegular(
                          size: 14.sp,
                          color: Style.blackColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    shopText,
                    style: Style.interNormal(
                      size: 12.sp,
                      color: Style.blackColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
