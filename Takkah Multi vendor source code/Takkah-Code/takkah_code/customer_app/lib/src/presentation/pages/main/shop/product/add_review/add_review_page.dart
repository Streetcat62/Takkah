import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../riverpod/provider/product_provider.dart';
import 'riverpod/provider/review_images_provider.dart';
import 'riverpod/provider/product_review_provider.dart';
import 'riverpod/provider/review_comment_provider.dart';
import '../../../../../../core/constants/constants.dart';

class AddReviewPage extends StatefulWidget {
  final int? shopId;
  final ProductData? productData;

  const AddReviewPage({Key? key, this.productData, this.shopId})
      : super(key: key);

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  double? _rating = 1;

  @override
  Widget build(BuildContext context) {
    final hasDiscount = widget.productData?.discount != null &&
        ((widget.productData?.discount ?? 0) > 0);
    final discountPrice = hasDiscount
        ? ((widget.productData?.price ?? 0) -
            (widget.productData?.discount ?? 0))
        : 0;
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: AppColors.mainAppbarBack(),
        appBar: CommonAppBar(
          title: AppHelpers.getTranslation(TrKeys.addReview),
          onLeadingPressed: context.popRoute,
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                45.verticalSpace,
                Row(
                  children: [
                    CommonImage(
                      imageUrl: widget.productData?.product?.img,
                      width: 80,
                      height: 80,
                      radius: 15,
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productData?.product?.translation?.title ??
                                '',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -0.4,
                            ),
                          ),
                          8.verticalSpace,
                          Row(
                            children: [
                              Text(
                                NumberFormat.currency(
                                  symbol: LocalStorage.instance
                                      .getSelectedCurrency()
                                      ?.symbol,
                                ).format(hasDiscount
                                    ? discountPrice
                                    : widget.productData?.price),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                  color: AppColors.iconAndTextColor(),
                                  letterSpacing: -0.2,
                                ),
                              ),
                              10.horizontalSpace,
                              if (hasDiscount)
                                Text(
                                  NumberFormat.currency(
                                    symbol: LocalStorage.instance
                                        .getSelectedCurrency()
                                        ?.symbol,
                                  ).format(widget.productData?.price),
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: AppColors.red,
                                    letterSpacing: -0.7,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                50.verticalSpace,
                Divider(
                  thickness: 1.r,
                  height: 1.r,
                  color: AppColors.black.withOpacity(0.1),
                ),
                20.verticalSpace,
                Center(
                  child: Column(
                    children: [
                      Text(
                        AppHelpers.getTranslation(TrKeys.evaluateTheProduct),
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.secondaryIconTextColor(),
                        ),
                      ),
                      20.verticalSpace,
                      RatingBar.builder(
                        itemBuilder: (context, index) {
                          return Icon(
                            FlutterRemix.star_smile_fill,
                            color: AppColors.warning,
                            size: 26.r,
                          );
                        },
                        onRatingUpdate: (rating) {
                          _rating = rating;
                        },
                        maxRating: 5,
                        minRating: 1,
                        initialRating: 1,
                        itemSize: 40.r,
                        itemPadding: EdgeInsetsDirectional.only(end: 20.r),
                        unratedColor: AppColors.unratedIcon(),
                        glow: false,
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                Divider(
                  thickness: 1.r,
                  height: 1.r,
                  color: AppColors.black.withOpacity(0.1),
                ),
                60.verticalSpace,
                Text(
                  AppHelpers.getTranslation(TrKeys.writeAReview),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: AppColors.iconAndTextColor(),
                    letterSpacing: -0.7,
                  ),
                ),
                14.verticalSpace,
                Container(
                  constraints: BoxConstraints(
                    minHeight: 220.r,
                    minWidth: double.infinity,
                  ),
                  padding: REdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.mainBackground(),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Consumer(
                    builder: (context, ref, child) {
                      return TextFormField(
                        onChanged:
                            ref.read(reviewCommentProvider.notifier).setComment,
                        cursorColor: AppColors.iconAndTextColor(),
                        cursorWidth: 1.r,
                        style: GoogleFonts.inter(
                          color: AppColors.iconAndTextColor(),
                          fontSize: 16.sp,
                          letterSpacing: -0.4,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 10,
                        decoration: InputDecoration.collapsed(
                          hintText: AppHelpers.getTranslation(TrKeys.typeHere),
                          hintStyle: GoogleFonts.inter(
                            color: AppColors.secondaryIconTextColor(),
                            fontSize: 16.sp,
                            letterSpacing: -0.4,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                60.verticalSpace,
                SizedBox(
                  height: 142.r,
                  child: Consumer(
                    builder: (context, ref, child) {
                      final imagesState = ref.watch(reviewImagesProvider);
                      final imagesNotifier =
                          ref.read(reviewImagesProvider.notifier);
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: (imagesState.reviewImages.length > 3)
                            ? imagesState.reviewImages.length
                            : (imagesState.reviewImages.length + 1),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return (imagesState.reviewImages.isNotEmpty &&
                                  index < imagesState.reviewImages.length)
                              ? AddDeleteImageButton(
                                  path: imagesState.reviewImages[index],
                                  onDeletePhoto: () =>
                                      imagesNotifier.removeImage(index),
                                )
                              : AddDeleteImageButton(
                                  onChangePhoto: imagesNotifier.addReviewFile,
                                );
                        },
                      );
                    },
                  ),
                ),
                104.verticalSpace,
                Consumer(
                  builder: (context, ref, child) {
                    return MainConfirmButton(
                      title: AppHelpers.getTranslation(TrKeys.save),
                      isLoading: ref.watch(productReviewProvider).isReviewing,
                      onTap: ref.watch(reviewCommentProvider).comment.isEmpty
                          ? null
                          : () {
                              ref
                                  .read(productReviewProvider.notifier)
                                  .addReview(
                                    uuid: widget.productData?.uuid,
                                    rating: _rating,
                                    imagePaths: ref
                                        .watch(reviewImagesProvider)
                                        .reviewImages,
                                    comment: ref
                                        .watch(reviewCommentProvider)
                                        .comment,
                                    checkYourNetwork: () {
                                      AppHelpers.showCheckFlash(
                                        context,
                                        AppHelpers.getTranslation(
                                            TrKeys.checkYourNetworkConnection),
                                      );
                                    },
                                    afterReviewed: () {
                                      context.popRoute();
                                      ref
                                          .read(productProvider.notifier)
                                          .fetchProductDetails(
                                            uuid: widget.productData?.uuid,
                                            shopId: widget.shopId,
                                            checkYourNetwork: () {
                                              AppHelpers.showCheckFlash(
                                                context,
                                                AppHelpers.getTranslation(TrKeys
                                                    .checkYourNetworkConnection),
                                              );
                                            },
                                          );
                                    },
                                  );
                            },
                    );
                  },
                ),
                40.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
