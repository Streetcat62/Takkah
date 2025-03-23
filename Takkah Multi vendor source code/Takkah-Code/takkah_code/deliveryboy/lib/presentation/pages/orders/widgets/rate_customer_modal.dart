import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../home/widgets/add_comment.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/models/models.dart';
import '../../../../infrastructure/services/services.dart';

class RateCustomerModal extends StatefulWidget {
  final OrderDetailData? order;

  const RateCustomerModal({Key? key, this.order}) : super(key: key);

  @override
  State<RateCustomerModal> createState() => _RateCustomerModalState();
}

class _RateCustomerModalState extends State<RateCustomerModal> {
  double _rate = 0;
  String _note = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.evaluation)),
          Text(
            AppHelpers.getTranslation(TrKeys.yourFeedbackService),
            style: Style.interNormal(size: 14.sp),
          ),
          24.verticalSpace,
          Text(
            AppHelpers.getTranslation(TrKeys.rateTheCustomer),
            style: Style.interSemi(size: 16.sp),
          ),
          14.verticalSpace,
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Style.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.all(16.r),
            child: RatingBar.builder(
              itemBuilder: (context, index) => const Icon(
                FlutterRemix.star_fill,
                color: Style.primaryColor,
              ),
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 11.r),
              direction: Axis.horizontal,
              onRatingUpdate: (double value) {
                _rate = value;
              },
              glow: false,
            ),
          ),
          14.verticalSpace,
          _addComment(context),
          24.verticalSpace,
          Consumer(
            builder: (context, ref, child) => CustomButton(
              title: AppHelpers.getTranslation(TrKeys.send),
              isLoading: ref.watch(userReviewProvider).isLoading,
              onPressed: () => ref.read(userReviewProvider.notifier).addReview(
                    context,
                    orderId: widget.order?.id,
                    rating: _rate,
                    comment: _note.isEmpty ? null : _note,
                    success: () => Navigator.pop(context),
                  ),
            ),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }

  Widget _addComment(BuildContext context) {
    return GestureDetector(
      onTap: () => AppHelpers.showCustomModalBottomSheet(
        context: context,
        modal: AddComment(
          onChange: (s) {
            _note = s;
          },
        ),
        isDarkMode: false,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Row(
          children: [
            const Icon(FlutterRemix.chat_1_fill),
            12.horizontalSpace,
            Text(
              _note.isEmpty
                  ? AppHelpers.getTranslation(TrKeys.noteAboutClient)
                  : _note,
              style: Style.interRegular(size: 13.sp, color: Style.blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
