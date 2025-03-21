import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../notification_page.dart';
import '../../../styles/style.dart';
import '../../../../infrastructure/services/services.dart';

class NotificationItem extends StatelessWidget {
  final String date;
  final String text;
  final bool isListPage;

  const NotificationItem({
    Key? key,
    required this.date,
    required this.text,
    this.isListPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppHelpers.showCustomModalBottomSheet(
          paddingTop: MediaQuery.of(context).padding.top,
          context: context,
          modal: const NotificationPage(),
          isDarkMode: false,
        );
      },
      child: Container(
        margin: isListPage
            ? EdgeInsets.only(bottom: 10.h)
            : EdgeInsets.only(right: 10.w),
        width: MediaQuery.of(context).size.width - 100.w,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: isListPage ? Style.white : Style.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isListPage ? Style.transparent : Style.borderColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: Style.interNormal(size: 12.sp, color: Style.textColor),
            ),
            10.verticalSpace,
            Text(
              text,
              style: Style.interRegular(size: 16.sp, color: Style.blackColor),
            ),
            10.verticalSpace,
            Text(
              "More",
              style: Style.interRegular(size: 14.sp, color: Style.blueColor),
            ),
          ],
        ),
      ),
    );
  }
}
