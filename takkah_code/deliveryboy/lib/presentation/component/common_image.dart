import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../styles/style.dart';
import '../../infrastructure/services/services.dart';

class CommonImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final Color? errorBackground;
  final BoxFit? fit;

  const CommonImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius = 10,
    this.errorBackground,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: AppHelpers.checkIsSvg(imageUrl)
          ? SvgPicture.network(
              AppHelpers.getImageUrl(imageUrl),
              width: width?.r,
              height: height?.r,
              fit: BoxFit.cover,
              placeholderBuilder: (_) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius.r),
                  color: Style.white,
                ),
              ),
            )
          : CachedNetworkImage(
              imageUrl: AppHelpers.getImageUrl(imageUrl),
              width: width?.r,
              height: height?.r,
              fit: fit ?? BoxFit.cover,
              progressIndicatorBuilder: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius.r),
                  color: Style.white,
                ),
              ),
              errorWidget: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: errorBackground ?? Style.greyColor,
                ),
                alignment: Alignment.center,
                child: Icon(
                  FlutterRemix.image_line,
                  color: Style.blackColor.withOpacity(0.5),
                  size: 20.r,
                ),
              ),
            ),
    );
  }
}
