import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../riverpod/provider/product_images_provider.dart';

class ProductImagesWidget extends StatelessWidget {
  final ProductData? productData;
  const ProductImagesWidget({Key? key, this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final imageState = ref.watch(productImagesProvider);
        final imageNotifier = ref.read(productImagesProvider.notifier);
        return Column(
          children: [
            Container(
              height: 250.r,
              alignment: Alignment.center,
              child: PageView.builder(
                itemCount: productData?.product?.galleries!.length,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  imageNotifier.setActiveImageIndex(index);
                },
                itemBuilder: (context, index) {
                  return  CommonImage(
                    imageUrl: productData?.product?.galleries?[index].path,
                    width: 216,
                    height: 256,
                    radius: 0,
                    fit: BoxFit.fitHeight,
                  );
                },
              ),
            ),
            20.verticalSpace,
            Container(
              margin: REdgeInsets.symmetric(horizontal: 16),
              height: 4,
              alignment: Alignment.center,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: productData?.product?.galleries?.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 40.r,
                    height: 4.r,
                    margin: REdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: imageState.activeImageIndex == index
                          ? AppColors.green
                          : AppColors.onBoardingDot(),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
