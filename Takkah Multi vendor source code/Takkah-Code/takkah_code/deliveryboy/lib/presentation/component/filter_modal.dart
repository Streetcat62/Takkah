import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'title_icon.dart';
import '../styles/style.dart';
import 'custom_date_picker.dart';
import 'buttons/custom_button.dart';
import 'tab_bars/custom_tab_bar.dart';
import '../../application/providers.dart';
import '../../infrastructure/services/services.dart';

class FilterModal extends StatefulWidget {
  final bool isTabBar;
  final DateTime? start;
  final DateTime? end;

  const FilterModal({Key? key, this.isTabBar = true, this.start, this.end})
      : super(key: key);

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<DateTime?> _rangeDatePicker = [];
  List<DateTime?> _newList = [];

  final _tabs = [
    Tab(child: Text(AppHelpers.getTranslation(TrKeys.today))),
    Tab(
      child: Text(
        AppHelpers.getTranslation(TrKeys.weekly),
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    ),
    Tab(
      child: Text(
        AppHelpers.getTranslation(TrKeys.monthly),
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    ),
    Tab(child: Text(AppHelpers.getTranslation(TrKeys.overall))),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _rangeDatePicker = [
      widget.start ?? DateTime.now(),
      widget.end ?? DateTime.now(),
    ];
    _tabController.addListener(
      () {
        switch (_tabController.index) {
          case 0:
            _rangeDatePicker = [
              DateTime.now(),
              DateTime.now(),
            ];
            _newList = _rangeDatePicker;
            break;
          case 1:
            _rangeDatePicker = [
              DateTime.now().subtract(const Duration(days: 7)),
              DateTime.now(),
            ];
            _newList = _rangeDatePicker;
            break;
          case 2:
            _rangeDatePicker = [
              DateTime.now().subtract(const Duration(days: 30)),
              DateTime.now(),
            ];
            _newList = _rangeDatePicker;
            break;
          case 3:
            _rangeDatePicker = [
              DateTime.now().subtract(const Duration(days: 120)),
              DateTime.now(),
            ];
            _newList = _rangeDatePicker;
            break;
        }
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.filter)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            AppHelpers.getTranslation(TrKeys.selectDesiredOrderHistory),
            style: Style.interNormal(
              size: 14.sp,
              color: Style.blackColor,
              letterSpacing: -0.3,
            ),
          ),
        ),
        widget.isTabBar
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: CustomTabBar(tabController: _tabController, tabs: _tabs),
              )
            : const SizedBox.shrink(),
        CustomDatePicker(
          range: _rangeDatePicker,
          onChange: (n) {
            _newList = n;
          },
        ),
        16.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Consumer(
            builder: (context, ref, child) {
              return CustomButton(
                title: AppHelpers.getTranslation(TrKeys.save),
                onPressed: () {
                  widget.isTabBar
                      ? ref.read(orderProvider.notifier).fetchHistoryOrders(
                          context,
                          start: _newList.first,
                          end: _newList.last)
                      : ref.read(statisticsProvider.notifier).fetchStatistics(
                            startTime: _newList.last ?? DateTime.now(),
                            endTime: _newList.first ?? DateTime.now(),
                          );
                  context.popRoute();
                },
              );
            },
          ),
        ),
        8.verticalSpace,
      ],
    );
  }
}
