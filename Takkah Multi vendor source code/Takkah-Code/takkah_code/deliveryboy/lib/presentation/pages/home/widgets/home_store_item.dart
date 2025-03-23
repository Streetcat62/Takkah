import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../routes/app_router.gr.dart';

class HomeStoreItem extends StatelessWidget {
  final String image;

  const HomeStoreItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(const StoryRoute()),
      child: Container(
        height: 176.h,
        width: 100.w,
        margin: EdgeInsets.only(left: 8.w),
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Style.primaryColor.withOpacity(0),
              Style.primaryColor.withOpacity(0.8)
            ],
          ),
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) {
              return ImageShimmer(
                isCircle: false,
                size: 16.r,
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                height: 176.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Style.greyColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  FlutterRemix.image_line,
                  color: Style.blackColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
