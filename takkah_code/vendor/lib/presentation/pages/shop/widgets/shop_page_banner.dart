import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/services/services.dart';

class ShopBanner extends StatelessWidget {
  const ShopBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 200.h,
      toolbarHeight: 56.h,
      backgroundColor: Style.white,
      flexibleSpace: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(restaurantProvider);
          return FlexibleSpaceBar(
            title: Stack(
              children: [
                Positioned(
                  bottom: 8.r,
                  left: 16.r,
                  child: ShopBorderedAvatar(
                    imageUrl: state.shop?.logoImg ??
                        LocalStorage.instance.getShop()?.logoImg,
                    imageSize: 36,
                    size: 46,
                    borderRadius: 12,
                    bgColor: Style.greyColor.withOpacity(0.65),
                  ),
                ),
                Positioned(
                  top: 8.r,
                  left: 72.r,
                  child: Text(
                    '${state.shop?.translation?.title ?? LocalStorage.instance.getShop()?.translation?.title}',
                    style:
                        Style.interSemi(size: 16.sp, color: Style.blackColor),
                  ),
                ),
              ],
            ),
            titlePadding: REdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            background: Padding(
              padding: EdgeInsets.only(bottom: 32.h),
              child: Container(
                height: 150.h + MediaQuery.of(context).padding.top,
                width: double.infinity,
                color: Style.greyColor,
                child: CommonImage(
                  imageUrl: state.shop?.backgroundImg ??
                      LocalStorage.instance.getShop()?.backgroundImg,
                  width: double.infinity,
                  radius: 0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
