import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';

class OnBoardingPage extends ConsumerStatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends ConsumerState<OnBoardingPage> {
  final splashData = [
    {
      'title': AppHelpers.getTranslation(TrKeys.fastReliableAndSavesTime),
      'image': AppAssets.pngLightModeImage7,
    },
    {
      'title': AppHelpers.getTranslation(TrKeys.theWorldsFirstPlatform),
      'image': AppAssets.pngLightModeImage6,
    },
    {
      'title': AppHelpers.getTranslation(TrKeys.liveEatAndShopping),
      'image': AppAssets.pngLightModeImage8,
    }
  ];

  int _selectedIndex = 0;

  Widget _page(index) {
    return SizedBox(
      width: 1.sw,
      height: 0.77.sh,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: -12,
            child: Image(
              image: AssetImage(splashData[index]['image']!),
              height: 0.7.sh,
              width: 1.sw,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 12,
            left: 32,
            right: 32,
            child: SizedBox(
              width: 0.75.sw,
              child: Text(
                '${splashData[index]['title']}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 40.sp,
                  color: AppColors.iconAndTextColor(),
                  letterSpacing: -2,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(index) {
    return Container(
      width: 40,
      height: 4,
      margin: EdgeInsets.only(left: index == 0 ? 0 : 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: _selectedIndex == index
            ? AppColors.green
            : AppColors.onBoardingDot(),
      ),
    );
  }

  Widget _indicator() {
    return Container(
      margin: REdgeInsets.only(left: 33, bottom: 32),
      width: 136.r,
      height: 4.r,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 3,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _dot(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: Container(
                width: 1.sw,
                margin: EdgeInsets.only(top: 0.075.sh, right: 16),
                alignment: Alignment.centerRight,
                child: Text(
                  AppHelpers.getTranslation(TrKeys.skip),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                    letterSpacing: -1,
                    color: AppColors.iconAndTextColor(),
                  ),
                ),
              ),
              onTap: () {
                LocalStorage.instance.setOnBoarded(onboarded: true);
                context.replaceRoute(const LoginRoute());
              },
            ),
            SizedBox(
              width: 1.sw,
              height: 0.76.sh,
              child: PageView.builder(
                itemBuilder: (context, index) => _page(index),
                itemCount: splashData.length,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (page) {
                  setState(() {
                    _selectedIndex = page;
                  });
                },
              ),
            ),
            _indicator(),
            Container(
              width: 1.sw,
              margin: REdgeInsets.only(left: 33),
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      LocalStorage.instance.setOnBoarded(onboarded: true);
                      context.replaceRoute(const LoginRoute());
                    },
                    child: SizedBox(
                      width: 0.5.sw - 60,
                      child: Text(
                        AppHelpers.getTranslation(TrKeys.login),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: AppColors.iconAndTextColor(),
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '  ${AppHelpers.getTranslation(TrKeys.or)}  ',
                    style: GoogleFonts.inter(
                      color: AppColors.iconAndTextColor(),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.3,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      LocalStorage.instance.setOnBoarded(onboarded: true);
                      context.replaceRoute(const EnterEmailRoute());
                    },
                    child: SizedBox(
                      width: 0.5.sw - 60,
                      child: Text(
                        AppHelpers.getTranslation(TrKeys.signUp),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: AppColors.iconAndTextColor(),
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
