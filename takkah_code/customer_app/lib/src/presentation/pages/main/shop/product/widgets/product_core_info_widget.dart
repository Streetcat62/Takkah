import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';

class ProductCoreInfoWidget extends StatelessWidget {
  final ProductData? productData;

  const ProductCoreInfoWidget({Key? key, this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ((productData?.quantity ?? 0) >= (productData?.minQty ?? 0))
              ? RichText(
                  text: TextSpan(
                    text: '${AppHelpers.getTranslation(TrKeys.available)} - ',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '${AppHelpers.getTranslation(TrKeys.inStock)} (${productData?.quantity})',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColors.blue,
                          letterSpacing: -0.4,
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  AppHelpers.getTranslation(TrKeys.outOfStock),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.red,
                    letterSpacing: -0.4,
                  ),
                ),
          20.verticalSpace,
          if (productData?.bonus != null)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.green, width: 2.r),
              ),
              padding: REdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: REdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  CommonImage(
                    imageUrl: productData?.bonus?.bonusProduct?.product?.img,
                    width: 90,
                    height: 90,
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: SizedBox(
                      height: 90.r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${productData?.bonus?.bonusProduct?.product?.translation?.title}',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -0.4,
                            ),
                          ),
                          Text(
                            '+${productData?.bonus?.bonusQuantity} ${AppHelpers.getTranslation(TrKeys.bonus).toLowerCase()}',
                            style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Text(
            AppHelpers.getTranslation(TrKeys.description),
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: AppColors.iconAndTextColor(),
              letterSpacing: -1,
            ),
          ),
          20.verticalSpace,
          Text(
            productData?.product?.translation?.description ?? '',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.iconAndTextColor(),
              letterSpacing: -0.4,
            ),
          ),
        ],
      ),
    );
  }
}
