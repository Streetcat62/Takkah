import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components.dart';
import '../../core/utils/utils.dart';
import '../../core/constants/constants.dart';

class DatePickerModal extends StatefulWidget {
  final ValueSetter<DateTime> onDateSaved;

  const DatePickerModal({Key? key, required this.onDateSaved})
      : super(key: key);

  @override
  State<DatePickerModal> createState() => _DatePickerModalState();
}

class _DatePickerModalState extends State<DatePickerModal> {
  DateTime date = DateTime.now();
  DateTime checkDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
                brightness: LocalStorage.instance.getAppThemeMode()
                    ? Brightness.dark
                    : Brightness.light,
              ),
              child: CupertinoDatePicker(
                use24hFormat: true,
                mode: CupertinoDatePickerMode.dateAndTime,
                minimumDate: DateTime.now(),
                maximumDate: DateTime.now().add(const Duration(hours: 5)),
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime value) {
                  if(value.isBefore(DateTime.now())) {
                    return;
                  }
                  else {
                    date = value;
                  }
                },
              ),
            ),
          ),
          16.verticalSpace,
          MainConfirmButton(
            title: AppHelpers.getTranslation(TrKeys.save),
            onTap: () {
              widget.onDateSaved(date);
              context.popRoute();
            },
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
