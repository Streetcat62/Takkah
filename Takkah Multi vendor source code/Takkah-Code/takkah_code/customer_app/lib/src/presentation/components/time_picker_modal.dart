import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/utils.dart';
import '../pages/main/shop/cart/checkout/riverpod/provider/checkout_deliveries_provider.dart';
import 'buttons/main_confirm_button.dart';
import '../../core/constants/constants.dart';

class TimePickerModal extends ConsumerStatefulWidget {
  final ValueSetter<DateTime> onSaved;
  final ValueSetter<bool>? isValid;
  final String? openTime;
  final String? closeTime;
  final bool? isBecomeSeller;

     const TimePickerModal({
      Key? key,
      required this.onSaved,
      this.isBecomeSeller,
      this.isValid,
      this.openTime,
      this.closeTime,
  }) : super(key: key);

  @override
  ConsumerState<TimePickerModal> createState() => _TimePickerModalState();
}

class _TimePickerModalState extends ConsumerState<TimePickerModal> {
  DateTime time = DateTime.now();
  bool isWorkDay = true;

  @override
  void initState() {
    super.initState();
    time = widget.openTime == null
        ? DateTime.now()
        : AppHelpers.getMinTime(widget.openTime!);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checkoutDeliveriesProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          24.verticalSpace,
          SizedBox(
            height: 300.r,
            child: CupertinoTheme(
              data: CupertinoThemeData(
                brightness: isDarkMode ? Brightness.dark : Brightness.light,
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                minimumDate: DateTime.now(),
                use24hFormat: true,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime value) {

                  if(widget.isBecomeSeller ?? false) {
                    time = value;
                  }

                  else {
                    if(
                    value.hour >= AppHelpers.getMinTime(widget.closeTime ?? '00:00').hour
                        || value.hour < AppHelpers.getMinTime(widget.openTime ?? '00:00').hour
                    ) {
                      if(
                      value.minute >= AppHelpers.getMinTime(widget.closeTime ?? '00:00').minute
                          ||  value.minute < AppHelpers.getMinTime(widget.openTime ?? '00:00').minute
                      ) {
                        widget.isValid!(false);
                        time = value;
                      }
                      else {
                        widget.isValid!(true);
                        time = value;
                      }
                    }
                    else {
                      widget.isValid!(true);
                      time = value;
                    }
                  }
                },
              ),
            ),
          ),
          16.verticalSpace,
          MainConfirmButton(
            title: state.isValid
                ? AppHelpers.getTranslation(TrKeys.save)
                : AppHelpers.getTranslation(TrKeys.closeTime),
            onTap:  () {
              if(state.isValid) {
                widget.onSaved(time);
                context.popRoute();
              }
            }
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
