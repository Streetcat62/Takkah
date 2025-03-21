import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/style.dart';
import '../../infrastructure/services/services.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String? desc;
  final String amount;
  final String price;

  const ProductItem({
    Key? key,
    required this.productName,
    required this.amount,
    required this.price,
    this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: Style.interSemi(size: 14.sp, color: Style.blackColor),
                  ),
                  4.verticalSpace,
                  Text(
                    '${AppHelpers.getTranslation(TrKeys.amount)} — $amount',
                    style:
                        Style.interRegular(size: 14.sp, color: Style.blackColor),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: Style.interSemi(size: 14.sp, color: Style.blackColor),
            ),
          ],
        ),
        desc != null
            ? Column(
                children: [
                  16.verticalSpace,
                  SizedBox(
                    width: 200.w,
                    child: RichText(
                      text: TextSpan(
                        text: '${AppHelpers.getTranslation(TrKeys.sideDish)}:',
                        style: Style.interSemi(
                            size: 14.sp, color: Style.blackColor),
                        children: [
                          TextSpan(
                            text: ' $desc',
                            style: Style.interRegular(
                                size: 14.sp, color: Style.blackColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
