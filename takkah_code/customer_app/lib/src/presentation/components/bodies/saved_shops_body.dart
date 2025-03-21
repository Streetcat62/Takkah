import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class SavedShopsBody extends StatelessWidget {
  final bool isLoading;
  final List<ShopData> shops;
  final bool fromDelivery;

  const SavedShopsBody({
    Key? key,
    required this.isLoading,
    required this.shops,
    required this.fromDelivery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLoading || shops.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  AppHelpers.getTranslation(TrKeys.savedShops),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: AppColors.iconAndTextColor(),
                    letterSpacing: -1,
                  ),
                ),
              ),
              16.verticalSpace,
            ],
          ),
        isLoading
            ? const HorizontalListShimmer(horizontalPadding: 16)
            : shops.isNotEmpty
                ? SizedBox(
                    height: 256.r,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: shops.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => HorizontalShopItem(
                        shop: shops[index],
                        fromDelivery: fromDelivery,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
      ],
    );
  }
}
