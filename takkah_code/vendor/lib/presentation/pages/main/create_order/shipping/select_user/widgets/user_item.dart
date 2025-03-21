import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../styles/style.dart';
import '../../../../../../component/components.dart';
import '../../../../../../../infrastructure/models/models.dart';

class UserItem extends StatelessWidget {
  final UserData user;
  final bool isSelected;
  final Function() onTap;

  const UserItem({
    Key? key,
    required this.user,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 74.r,
        margin: REdgeInsets.only(bottom: 8),
        padding: REdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Style.primaryColor.withOpacity(0.06) : Style.white,
          borderRadius: isSelected ? null : BorderRadius.circular(10.r),
          border: isSelected
              ? Border(
                  left: BorderSide(color: Style.primaryColor, width: 1.r),
                )
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Style.blackColor.withOpacity(0.06),
              ),
              alignment: Alignment.center,
              child: CommonImage(
                imageUrl: user.img,
                width: 40,
                height: 40,
                radius: 20,
                errorRadius: 20,
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${user.firstname} ${user.lastname ?? ''}',
                    style: Style.interSemi(size: 15.sp),
                  ),
                  4.verticalSpace,
                  Text(
                    user.email ?? '',
                    style: Style.interNormal(size: 12.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
