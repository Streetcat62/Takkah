import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/routes/app_router.gr.dart';

class BrandItem extends StatelessWidget {
  final BrandData brand;
  final int? shopId;

  const BrandItem({Key? key, required this.brand, this.shopId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushRoute(BrandProductsRoute(brand: brand, shopId: shopId)),
      child: Container(
        width: 120.r,
        height: 120.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.mainAppbarBack(),
        ),
        alignment: Alignment.center,
        child: CommonImage(
          imageUrl: brand.brand?.img,
          width: 70,
          height: 70,
          radius: 35,
        ),
      ),
    );
  }
}
