import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../infrastructure/models/models.dart';
import '../../../../../../infrastructure/services/services.dart';
import '../../../../../styles/style.dart';

class SearchedUserItem extends StatelessWidget {
  final UserData user;

  const SearchedUserItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Style.white,
      ),
      padding: REdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      margin: REdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${user.firstname ?? AppHelpers.trans(TrKeys.noName)} ${user.lastname ?? ''}',
            style: Style.interNormal(),
          ),
          6.verticalSpace,
          Text(
            '${user.email}',
            style: Style.interRegular(size: 12.sp),
          ),
        ],
      ),
    );
  }
}
