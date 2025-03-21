import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/helper/common_image.dart';
import '../../../../../styles/style.dart';

class GridContainer extends StatelessWidget {
  final String image;
  final String title;
  const GridContainer({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Style.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          5.verticalSpace,
          CommonImage(
            imageUrl: image,
            height: 50,
            width: 50,
          ),
          15.verticalSpace,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: Style.interNormal(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
