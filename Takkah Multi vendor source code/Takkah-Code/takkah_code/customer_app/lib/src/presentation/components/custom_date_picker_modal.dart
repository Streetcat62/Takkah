import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/utils.dart';
import 'buttons/main_confirm_button.dart';
import '../../core/constants/constants.dart';

class CustomDatePickerModal extends StatefulWidget {
  final String? initialDate;
  final ValueSetter<DateTime?> onDateSaved;
  final DateTime? maxDate;

  const CustomDatePickerModal({
    Key? key,
    this.initialDate,
    required this.onDateSaved,
    this.maxDate,
  }) : super(key: key);

  @override
  State<CustomDatePickerModal> createState() => _CustomDatePickerModalState();
}

class _CustomDatePickerModalState extends State<CustomDatePickerModal> {
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    final int year = DateTime.now().year - 18;
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
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
                mode: CupertinoDatePickerMode.date,
                initialDateTime: (widget.initialDate == null ||
                        (widget.initialDate?.isEmpty ?? false))
                    ? DateTime.parse("$year-12-01 00:00:00.000")
                    : DateTime.parse(widget.initialDate ?? ''),
                maximumDate: DateTime.parse("$year-12-01 00:00:00.000"),
                onDateTimeChanged: (DateTime value) {
                  date = value;
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
