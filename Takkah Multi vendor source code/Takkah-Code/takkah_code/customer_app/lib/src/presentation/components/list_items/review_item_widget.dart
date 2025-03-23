import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../small_dot.dart';
import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';

class ReviewItemWidget extends StatelessWidget {
  final ReviewData review;
  final Color? background;

  const ReviewItemWidget({Key? key, required this.review, this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: background ?? AppColors.mainAppbarBack(),
      ),
      padding: REdgeInsets.all(16),
      margin: REdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CommonImage(
                    imageUrl: review.user?.img,
                    width: 40,
                    height: 40,
                    radius: 20,
                  ),
                  10.horizontalSpace,
                  Text(
                    ('${review.user?.firstname} ${review.user?.lastname}')
                                .length >
                            16
                        ? '${review.user?.firstname}'
                        : '${review.user?.firstname} ${review.user?.lastname}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.7,
                    ),
                  ),
                  6.horizontalSpace,
                  const SmallDot(),
                  6.horizontalSpace,
                  Text(
                    '${review.createdAt?.substring(0, 10)}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.secondaryIconTextColor(),
                      letterSpacing: -0.7,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  5.horizontalSpace,
                  Icon(
                    FlutterRemix.star_smile_fill,
                    size: 20.r,
                    color: AppColors.warning,
                  ),
                  5.horizontalSpace,
                  Text(
                    '${review.rating}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.7,
                    ),
                  ),
                ],
              ),
            ],
          ),
          14.verticalSpace,
          Text(
            review.comment ?? '',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: AppColors.secondaryIconTextColor(),
              letterSpacing: -0.7,
            ),
          ),
          18.verticalSpace,
          if ((review.galleries != null &&
              (review.galleries?.isNotEmpty ?? false)))
            SizedBox(
              height: 60.r,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: review.galleries?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsetsDirectional.only(end: 10.r),
                  child: CommonImage(
                    imageUrl: review.galleries?[index].path,
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
