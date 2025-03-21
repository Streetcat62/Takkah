import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../infrastructure/services/services.dart';
import '../../routes/app_router.gr.dart';
import '../../styles/style.dart';

class NoConnectionPage extends ConsumerWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Style.white,
      body: Column(
        children: [
          const SizedBox(height: 200, width: double.infinity),
          const Icon(
            FlutterRemix.wifi_off_fill,
            size: 120,
            color: Style.blackColor,
          ),
          const SizedBox(height: 20),
          Text(
            AppHelpers.getTranslation(TrKeys.noInternetConnection),
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              color: Style.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              context.replaceRoute(const SplashRoute());
            },
            child: const Icon(
              FlutterRemix.restart_fill,
              color: Style.blackColor,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
