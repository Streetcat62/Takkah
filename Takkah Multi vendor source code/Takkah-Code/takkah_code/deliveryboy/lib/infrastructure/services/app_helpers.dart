import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import 'tr_keys.dart';
import 'local_storage.dart';
import 'app_constants.dart';
import '../models/models.dart';
import '../../presentation/styles/style.dart';
import '../../presentation/component/components.dart';

class AppHelpers {
  AppHelpers._();

  static String getImageUrl(String? url) {
    if (url == null || url.isEmpty) {
      return '';
    }
    if (url.length > 3 && url.substring(0, 4).toLowerCase().contains('http')) {
      return url;
    }
    return '${AppConstants.imageBaseUrl}/$url';
  }

  static String? getInitialTypeOfTechnique() {
    final String? technique =
        LocalStorage.instance.getDriverInfo()?.data?.typeOfTechnique;
    switch (technique) {
      case TrKeys.benzine:
        return AppHelpers.getTranslation(TrKeys.benzine);
      case TrKeys.diesel:
        return AppHelpers.getTranslation(TrKeys.diesel);
      case TrKeys.gas:
        return AppHelpers.getTranslation(TrKeys.gas);
      case TrKeys.motorbike:
        return AppHelpers.getTranslation(TrKeys.motorbike);
      case TrKeys.bike:
        return AppHelpers.getTranslation(TrKeys.bike);
      case TrKeys.foot:
        return AppHelpers.getTranslation(TrKeys.foot);
    }
    return null;
  }

  static String? getAppPhone() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'phone') {
        return setting.value;
      }
    }
    return '';
  }

  static String getAppName() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'title') {
        return setting.value ?? 'Sundaymart';
      }
    }
    return 'Sundaymart';
  }

  static int getAppDeliveryTime() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'deliveryman_order_acceptance_time') {
        return int.parse(setting.value ?? '30');
      }
    }
    return int.parse('30');
  }

  static bool checkIsSvg(String? url) {
    if (url == null) {
      return false;
    }
    final length = url.length;
    return url.substring(length - 3, length) == 'svg';
  }

  static showNoConnectionSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Text(
        'No internet connection',
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Style.white,
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        disabledTextColor: Colors.white,
        textColor: Colors.yellow,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showCheckTopSnackBar(BuildContext context, String text) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: "$text. Please check your credentials and try again",
      ),
    );
  }

  static showCheckTopSnackBarInfo(BuildContext context, String text) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: "$text. Please check your credentials and try again",
      ),
    );
  }

  static String getTranslation(String trKey) {
    final Map<String, dynamic> translations =
        LocalStorage.instance.getTranslations();
    for (final key in translations.keys) {
      if (trKey == key) {
        return translations[key];
      }
    }
    return trKey;
  }

  static String getTranslationReverse(String trKey) {
    final Map<String, dynamic> translations =
        LocalStorage.instance.getTranslations();
    for (int i = 0; i < translations.values.length; i++) {
      if (trKey == translations.values.elementAt(i)) {
        return translations.keys.elementAt(i);
      }
    }
    return trKey;
  }

  static void showCustomModalBottomSheet({
    required BuildContext context,
    required Widget modal,
    required bool isDarkMode,
    double radius = 16,
    bool isDrag = true,
    bool isExpanded = false,
    double paddingTop = 200,
    bool isDismissible = true,
  }) {
    showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - paddingTop.r,
      ),
      backgroundColor: Style.transparent,
      context: context,
      builder: (context) => BlurWrap(
        radius: BorderRadius.only(
          topRight: Radius.circular(12.r),
          topLeft: Radius.circular(12.r),
        ),
        child: Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          decoration: BoxDecoration(
            color: Style.white.withOpacity(0.9),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              topLeft: Radius.circular(12.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Style.blackColor.withOpacity(0.25),
                blurRadius: 40,
                spreadRadius: 0,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    color: Style.bottomSheetIconColor,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
                ),
                modal,
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showCustomModalBottomSheetWithoutIosIcon({
    required BuildContext context,
    required Widget modal,
    required bool isDarkMode,
    double radius = 16,
    bool isDrag = true,
    double paddingTop = 200,
  }) {
    showModalBottomSheet(
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - paddingTop.r,
      ),
      backgroundColor: Style.transparent,
      context: context,
      builder: (context) => modal,
    );
  }

  static void showAlertDialog({
    required BuildContext context,
    required Widget child,
    double radius = 16,
  }) {
    Dialog alert = Dialog(
      backgroundColor: Style.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
      ),
      insetPadding: EdgeInsets.all(16.r),
      child: child,
    );

    showDialog(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
