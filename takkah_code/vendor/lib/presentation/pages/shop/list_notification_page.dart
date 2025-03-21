import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import 'widgets/notification_item.dart';
import '../../component/components.dart';
import '../../../infrastructure/services/services.dart';

class ListNotificationPage extends StatelessWidget {
  const ListNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.greyColor,
      body: Column(
        children: [
          CustomAppBar(
            bottomPadding: 16.h,
            child: Text(
              AppHelpers.trans(TrKeys.notifications),
              style: Style.interSemi(size: 18.sp),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 30.h,
                left: 16.w,
                right: 16.w,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              shrinkWrap: true,
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return const NotificationItem(
                  date: "June 24",
                  text: "Check your settings you have notifications turned off",
                  isListPage: true,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: const PopButton(heroTag: AppConstants.heroTagListNotification),
      ),
    );
  }
}
