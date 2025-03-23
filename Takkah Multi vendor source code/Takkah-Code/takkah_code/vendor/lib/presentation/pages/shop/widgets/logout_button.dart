import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'logout_modal.dart';
import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../../infrastructure/services/services.dart';

class LogoutButton extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onChange;

  const LogoutButton({Key? key, required this.isOpen, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 6.r,
      right: 16.r,
      child: Row(
        children: [
          BlurWrap(
            radius: BorderRadius.circular(10.r),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Style.blackColor.withOpacity(0.29),
              ),
              padding: EdgeInsets.all(4.r),
              child: CustomToggle(
                isText: true,
                key: UniqueKey(),
                controller: ValueNotifier<bool>(isOpen),
                onChange: (value) {
                  onChange();
                },
              ),
            ),
          ),
          16.horizontalSpace,
          ButtonsBouncingEffect(
            child: GestureDetector(
              onTap: () => AppHelpers.showCustomModalBottomSheet(
                context: context,
                modal: const LogoutModal(),
                isDarkMode: LocalStorage.instance.getAppThemeMode(),
              ),
              child: BlurWrap(
                radius: BorderRadius.circular(10.r),
                child: Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Style.blackColor.withOpacity(0.29),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    FlutterRemix.logout_circle_r_line,
                    color: Style.white,
                    size: 22.r,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
