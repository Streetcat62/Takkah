import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';

class UserItemForTogether extends StatelessWidget {
  final UserCartData? userCartData;
  final bool isLast;
  final VoidCallback onDelete;

  const UserItemForTogether({
    Key? key,
    this.userCartData,
    required this.isLast,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                userCartData?.userId == null
                    ? CircleIconButton(
                        onTap: onDelete,
                        iconData: FlutterRemix.close_line,
                        iconColor: AppColors.iconAndTextColor(),
                        backgroundColor: AppColors.unratedIcon(),
                        width: 30,
                      )
                    : 30.horizontalSpace,
                12.horizontalSpace,
                Text(
                  '${userCartData?.name} ${userCartData?.userId != null ? '(${AppHelpers.getTranslation(TrKeys.you)})' : ''}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.iconAndTextColor(),
                    letterSpacing: -0.4,
                  ),
                ),
              ],
            ),
            if (userCartData?.userId == null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: userCartData?.status == 1
                      ? AppColors.unratedIcon()
                      : AppColors.green,
                ),
                padding: REdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  userCartData?.status == 1
                      ? '${AppHelpers.getTranslation(TrKeys.choosing)}...'
                      : AppHelpers.getTranslation(TrKeys.ready),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: userCartData?.status == 1
                        ? AppColors.iconAndTextColor()
                        : AppColors.white,
                    letterSpacing: -0.4,
                  ),
                ),
              ),
          ],
        ),
        12.verticalSpace,
        if (!isLast) Divider(height: 1.r, thickness: 1.r),
        12.verticalSpace,
      ],
    );
  }
}
