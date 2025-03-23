import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/components.dart';
import '../../styles/style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TitleAndIcon(
              title: "Check your settings, you have notifications turned off"),
        ),
        20.verticalSpace,
        SizedBox(
          height: 210.h,
          width: double.infinity,
          child: ClipRRect(
            child: CachedNetworkImage(
              imageUrl:
                  "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) {
                return ImageShimmer(size: 210.r, isCircle: false);
              },
              errorWidget: (context, url, error) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Style.greyColor,
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
        24.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "You can connect up to 5 bank cards to the application:",
            style: Style.interNormal(size: 14.sp, color: Style.blackColor),
          ),
        ),
        12.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.r),
          child: Text(
            '''1. Open the → Payment methods menu of the application and click the Connect Card (or Add Card) button.\n2. Card number, validity period and CVV code\n3. Enter You can enter the card number manually or scan it using your smartphone's camera - click on the icon. ''',
            style: Style.interRegular(size: 12.sp, color: Style.textColor),
          ),
        ),
      ],
    );
  }
}
