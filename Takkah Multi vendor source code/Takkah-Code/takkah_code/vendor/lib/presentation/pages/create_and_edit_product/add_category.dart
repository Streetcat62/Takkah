import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/components.dart';
import '../../../infrastructure/services/services.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          TitleAndIcon(
            title: AppHelpers.trans(TrKeys.addNewCategory),
          ),
          24.verticalSpace,
          UnderlinedTextField(
            label: AppHelpers.trans(TrKeys.categoryName),
          ),
          36.verticalSpace,
          CustomButton(
            title: AppHelpers.trans(TrKeys.save),
            onPressed: context.popRoute,
          )
        ],
      ),
    );
  }
}
