import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../infrastructure/services/services.dart';
import '../../../component/components.dart';

class AddComment extends StatelessWidget {
  final ValueChanged<String> onChange;

  const AddComment({Key? key, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          TitleAndIcon(
            title: AppHelpers.getTranslation(TrKeys.addComment),
          ),
          24.verticalSpace,
          UnderlinedBorderTextField(
            label: AppHelpers.getTranslation(TrKeys.comment),
            onChanged: onChange,
          ),
          36.verticalSpace,
          CustomButton(
            title: AppHelpers.getTranslation(TrKeys.save),
            onPressed: context.popRoute,
          ),
          36.verticalSpace,
        ],
      ),
    );
  }
}
