import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/models/models.dart';
import '../../../../infrastructure/services/services.dart';

class WorkingTimeModal extends ConsumerStatefulWidget {
  const WorkingTimeModal({Key? key}) : super(key: key);

  @override
  ConsumerState<WorkingTimeModal> createState() => _WorkingTimeModalState();
}

class _WorkingTimeModalState extends ConsumerState<WorkingTimeModal> {
  late List<ShopWorkingDays> _workingDays;
  late List<ShopWorkingDays> _savingWorkingDays;
  bool _shouldUpdate = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final state = ref.watch(restaurantProvider);
        _workingDays = state.shop?.shopWorkingDays ?? [];
        _savingWorkingDays = state.shop?.shopWorkingDays ?? [];
        ref
            .read(workingDaysProvider.notifier)
            .setShopWorkingDays(shop: state.shop);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(workingDaysProvider);
            final shopState = ref.watch(restaurantProvider);
            final event = ref.read(workingDaysProvider.notifier);
            final shopEvent = ref.read(restaurantProvider.notifier);
            return state.workingDays.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3.r,
                      color: Style.primaryColor,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ModalDrag(),
                      TitleAndIcon(
                        title: AppHelpers.trans(TrKeys.workingHours),
                      ),
                      Text(
                        AppHelpers.trans(TrKeys.enterOpeningHours),
                        style: Style.interNormal(
                          size: 14.sp,
                          color: Style.blackColor,
                        ),
                      ),
                      24.verticalSpace,
                      SizedBox(
                        height: 40.r,
                        width: MediaQuery.of(context).size.width - 32.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ..._workingDays.map(
                              (ShopWorkingDays day) => GestureDetector(
                                onTap: () {
                                  event.changeIndex(day);
                                  _savingWorkingDays = _workingDays;
                                },
                                child: SmallWeekdayItem(
                                  isSelected: state.currentIndex ==
                                      _workingDays.indexOf(day),
                                  day: day,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      30.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppHelpers.trans(TrKeys.setBusinessDay),
                            style: Style.interNormal(
                              size: 16.sp,
                              letterSpacing: -0.3,
                            ),
                          ),
                          CustomToggle(
                            key: UniqueKey(),
                            controller: ValueNotifier<bool>(
                              !(_savingWorkingDays[state.currentIndex]
                                      .disabled ??
                                  false),
                            ),
                            onChange: (value) {
                              _setDisabledDay(
                                currentIndex: state.currentIndex,
                                disabled: value,
                              );
                            },
                          ),
                        ],
                      ),
                      40.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 160.h,
                              child: CupertinoDatePicker(
                                key: UniqueKey(),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: DateTime(
                                  2022,
                                  1,
                                  1,
                                  int.tryParse(
                                          _savingWorkingDays[state.currentIndex]
                                                  .from
                                                  ?.substring(0, 2) ??
                                              '') ??
                                      0,
                                  int.parse(
                                      _savingWorkingDays[state.currentIndex]
                                              .from
                                              ?.substring(3, 5) ??
                                          ''),
                                ),
                                onDateTimeChanged: (DateTime newDateTime) {
                                  _setTimeToDay(
                                    time: TimeOfDay.fromDateTime(newDateTime),
                                    currentIndex: state.currentIndex,
                                  );
                                },
                                use24hFormat: true,
                                minuteInterval: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 160.h,
                              child: CupertinoDatePicker(
                                key: UniqueKey(),
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: true,
                                minuteInterval: 1,
                                initialDateTime: DateTime(
                                  2022,
                                  1,
                                  1,
                                  int.parse(
                                      _savingWorkingDays[state.currentIndex]
                                              .to
                                              ?.substring(0, 2) ??
                                          ''),
                                  int.parse(
                                      _savingWorkingDays[state.currentIndex]
                                              .to
                                              ?.substring(3, 5) ??
                                          ''),
                                ),
                                onDateTimeChanged: (DateTime newDateTime) {
                                  _setTimeToDay(
                                    time: TimeOfDay.fromDateTime(newDateTime),
                                    isFrom: false,
                                    currentIndex: state.currentIndex,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      40.verticalSpace,
                      CustomButton(
                        title: AppHelpers.trans(TrKeys.save),
                        isLoading: state.isLoading,
                        onPressed: () {
                          _savingWorkingDays = _workingDays;
                          if (_shouldUpdate) {
                            event.updateWorkingDays(
                              days: _savingWorkingDays,
                              shopUuid: shopState.shop?.uuid,
                              updateSuccess: () {
                                shopEvent.updateWorkingDays(_savingWorkingDays);
                                context.popRoute();
                              },
                            );
                          }
                        },
                      ),
                      30.verticalSpace,
                    ],
                  );
          },
        ),
      ),
    );
  }

  void _setDisabledDay({
    bool? disabled,
    required int currentIndex,
  }) {
    _shouldUpdate = true;
    _workingDays[currentIndex] =
        _workingDays[currentIndex].copyWith(disabled: !(disabled ?? false));
  }

  void _setTimeToDay({
    required TimeOfDay time,
    bool isFrom = true,
    required int currentIndex,
  }) {
    _shouldUpdate = true;
    if (isFrom) {
      _workingDays[currentIndex] = _workingDays[currentIndex].copyWith(
        from:
            '${time.hour.toString().padLeft(2, '0')}-${time.minute.toString().padLeft(2, '0')}',
      );
    } else {
      _workingDays[currentIndex] = _workingDays[currentIndex].copyWith(
        to: '${time.hour.toString().padLeft(2, '0')}-${time.minute.toString().padLeft(2, '0')}',
      );
    }
  }
}
