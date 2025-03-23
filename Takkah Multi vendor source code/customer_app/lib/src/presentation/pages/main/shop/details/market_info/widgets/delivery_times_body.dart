import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import '../../../../../../theme/theme.dart';
import '../../../../../../../core/utils/utils.dart';
import '../riverpod/provider/delivery_times_provider.dart';

class DeliveryTimesBody extends ConsumerWidget {
  final String? openTime;
  final String? closeTime;

  const DeliveryTimesBody({Key? key, this.openTime, this.closeTime})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deliveryTimesProvider);
    final notifier = ref.read(deliveryTimesProvider.notifier);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          30.verticalSpace,
          Container(
            height: 390.r,
            margin: REdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.mainAppbarBack(),
            ),
            padding: REdgeInsets.symmetric(vertical: 25),
            child: Platform.isAndroid
                ? CalendarCarousel(
                    height: 390.r,
                    scrollDirection: Axis.horizontal,
                    isScrollable: false,
                    viewportFraction: 7,
                    dayPadding: 2,
                    weekDayFormat: WeekdayFormat.standaloneNarrow,
                    customGridViewPhysics: const NeverScrollableScrollPhysics(),
                    headerMargin: EdgeInsets.zero,
                    weekDayMargin: EdgeInsets.zero,
                    weekDayPadding: EdgeInsets.zero,
                    childAspectRatio: 1.5,
                    todayBorderColor: AppColors.transparent,
                    todayButtonColor: AppColors.transparent,
                    selectedDayBorderColor: AppColors.green,
                    selectedDateTime: state.selectedDateTime,
                    staticSixWeekFormat: true,
                    onDayPressed: (date, _) => notifier.setSelectedDate(date),
                    minSelectedDate: DateTime.now(),
                    daysTextStyle: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                    todayTextStyle: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                    selectedDayTextStyle: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                      letterSpacing: -0.4,
                    ),
                    headerTextStyle: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                    inactiveDaysTextStyle: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryIconTextColor(),
                      letterSpacing: -0.4,
                    ),
                    inactiveWeekendTextStyle: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                    markedDateCustomTextStyle: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                      letterSpacing: -0.4,
                    ),
                    weekendTextStyle: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                    weekdayTextStyle: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                    leftButtonIcon: Icon(
                      FlutterRemix.arrow_left_s_line,
                      size: 18.r,
                      color: AppColors.iconAndTextColor(),
                    ),
                    rightButtonIcon: Icon(
                      FlutterRemix.arrow_right_s_line,
                      size: 18.r,
                      color: AppColors.iconAndTextColor(),
                    ),
                  )
                : CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    minimumDate: DateTime.now(),
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: notifier.setSelectedDate,
                  ),
          ),
          15.verticalSpace,
          ListView.builder(
            itemCount: AppHelpers.getDeliveryTimes(openTime, closeTime).length,
            shrinkWrap: true,
            padding: REdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.mainAppbarBack(),
                ),
                padding: REdgeInsets.symmetric(vertical: 24, horizontal: 38),
                margin: REdgeInsets.only(bottom: 8),
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${state.selectedDateTime?.day}.${state.selectedDateTime?.month}.${state.selectedDateTime?.year}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.iconAndTextColor(),
                        letterSpacing: -0.4,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      AppHelpers.getDeliveryTimes(openTime, closeTime)[index],
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: AppColors.iconAndTextColor(),
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}
