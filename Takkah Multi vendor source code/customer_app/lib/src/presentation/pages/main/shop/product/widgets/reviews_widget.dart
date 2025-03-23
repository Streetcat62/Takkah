import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'reviews_modal.dart';
import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';

class ReviewsWidget extends StatelessWidget {
  final ProductData? productData;

  const ReviewsWidget({Key? key, this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (productData?.reviews != null &&
            (productData?.reviews?.isNotEmpty ?? false))
        ? Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ...productData!.reviews!
                    .take(2)
                    .toList()
                    .map(
                      (review) => ReviewItemWidget(review: review),
                    )
                    .toList(),
                if (productData!.reviews!.length > 2)
                  CustomOutlinedButton(
                    onTap: () {
                      AppHelpers.showCustomModalBottomSheet(
                        context: context,
                        modal: ReviewsModal(productData: productData),
                        paddingTop: 90,
                      );
                    },
                    title: AppHelpers.getTranslation(TrKeys.viewMore),
                  ),
              ],
            ),
          )
        : Center(
            child: Text(
              AppHelpers.getTranslation(TrKeys.thereIsNoReviews),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppColors.iconAndTextColor(),
                letterSpacing: -0.4,
              ),
            ),
          );
  }
}
