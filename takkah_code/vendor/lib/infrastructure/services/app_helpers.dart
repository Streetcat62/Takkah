import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tr_keys.dart';
import 'app_constants.dart';
import 'local_storage.dart';
import '../models/models.dart';
import '../../presentation/styles/style.dart';

class AppHelpers {
  AppHelpers._();

  static String? selectedAddonsTitles(Stock stock) {
    final List<AddonData> addons = stock.localAddons ?? [];
    if (addons.isEmpty) {
      return null;
    }
    String text = '${addons[0].product?.translation?.title}';
    if (addons.length > 1) {
      for (int i = 1; i < addons.length; i++) {
        text =
            '$text${i != addons.length ? ',' : ''} ${addons[i].product?.translation?.title} ';
      }
    }
    return text;
  }

  static String truncate(String value, int length) {
    return value.length > length ? value.substring(0, length) : value;
  }

  static String getShopWorkingTimeForToday() {
    final shop = LocalStorage.instance.getShop();
    if (shop == null) {
      return trans(TrKeys.theShopIsClosedToday);
    }
    final currentWeekday =
        DateFormat('EEEE').format(DateTime.now()).toLowerCase();
    final List<ShopWorkingDays> workingDays = shop.shopWorkingDays ?? [];
    for (final day in workingDays) {
      if (day.day?.toLowerCase() == currentWeekday) {
        if (day.disabled ?? false) {
          return trans(TrKeys.theShopIsClosedToday);
        }
        return '${day.from?.substring(0, 2)}:${day.from?.substring(3, 5)} - ${day.to?.substring(0, 2)}:${day.to?.substring(3, 5)}';
      }
    }
    return '';
  }

  static double? getInitialLatitude() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'location') {
        final String? latString =
            setting.value?.substring(0, setting.value?.indexOf(','));
        if (latString == null) {
          return null;
        }
        final double? lat = double.tryParse(latString);
        return lat;
      }
    }
    return null;
  }

  static double? getInitialLongitude() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'location') {
        final String? latString =
            setting.value?.substring(0, setting.value?.indexOf(','));
        if (latString == null) {
          return null;
        }
        final String? lonString = setting.value
            ?.substring((latString.length) + 2, setting.value?.length);
        if (lonString == null) {
          return null;
        }
        final double lon = double.parse(lonString);
        return lon;
      }
    }
    return null;
  }

  static ExtrasType getExtraTypeByValue(String? value) {
    switch (value) {
      case 'color':
        return ExtrasType.color;
      case 'text':
        return ExtrasType.text;
      case 'image':
        return ExtrasType.image;
      default:
        return ExtrasType.text;
    }
  }

  static OrderStatus getUpdatableStatus(String? value) {
    switch (value) {
      case 'new':
        return OrderStatus.accepted;
      case 'accepted':
        return OrderStatus.ready;
      case 'ready':
        return OrderStatus.onAWay;
      case 'on_a_way':
        return OrderStatus.delivered;
      case 'delivered':
        return OrderStatus.newOrder;
      case 'canceled':
        return OrderStatus.canceled;
      default:
        return OrderStatus.accepted;
    }
  }

  static String changeStatusButtonText(String? value) {
    switch (value) {
      case 'new':
        return trans(TrKeys.swipeToAccept);
      case 'accepted':
        return trans(TrKeys.swipeToReady);
      case 'ready':
        return trans(TrKeys.swipeToWay);
      case 'on_a_way':
        return trans(TrKeys.swipeToDelivered);
      case 'delivered':
        return trans(TrKeys.swipeToAccept);
      case 'canceled':
        return trans(TrKeys.swipeToAccept);
      default:
        return trans(TrKeys.swipeToAccept);
    }
  }

  static OrderStatus getOrderStatus(String? value) {
    switch (value) {
      case 'new':
        return OrderStatus.newOrder;
      case 'accepted':
        return OrderStatus.accepted;
      case 'ready':
        return OrderStatus.ready;
      case 'on_a_way':
        return OrderStatus.onAWay;
      case 'delivered':
        return OrderStatus.delivered;
      case 'canceled':
        return OrderStatus.canceled;
      default:
        return OrderStatus.newOrder;
    }
  }

  static bool checkIsSvg(String? url) {
    if (url == null) {
      return false;
    }
    final length = url.length;
    return url.substring(length - 3, length) == 'svg';
  }

  static String getAppName() {
    // final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    // for (final setting in settings) {
    //   if (setting.key == 'title') {
    //     return setting.value ?? 'Foodyman';
    //   }
    // }
    return '';
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

  static showCheckTopSnackBar(
    BuildContext context, {
    String? text,
    SnackBarType? type,
  }) {
    return showTopSnackBar(
      Overlay.of(context),
      type == SnackBarType.error
          ? CustomSnackBar.error(
              message: text ??
                  AppHelpers.trans(TrKeys.somethingWentWrongWithTheServer),
            )
          : (type == SnackBarType.success
              ? CustomSnackBar.success(
                  message:
                      text ?? AppHelpers.trans(TrKeys.successfullyCompleted),
                )
              : CustomSnackBar.info(
                  message: text ?? AppHelpers.trans(TrKeys.infoMessage),
                )),
    );
  }

  static String trans(String trKey) {
    final Map<String, dynamic> translations =
        LocalStorage.instance.getTranslations();
    for (final key in translations.keys) {
      if (trKey == key) {
        return translations[key];
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
    bool isDismissible = true,
    double paddingTop = 200,
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
      builder: (context) =>
          Padding(padding: MediaQuery.of(context).viewInsets, child: modal),
    );
  }

  // static void showCustomModalBottomSheet({
  //   Key? key,
  //   required BuildContext context,
  //   required Widget modal,
  //   required bool isDarkMode,
  //   double radius = 16,
  //   bool isDrag = true,
  //   bool isExpanded = false,
  //   double paddingTop = 200,
  //   bool isDismissible = true,
  // }) {
  //   showModalBottomSheet(
  //     isDismissible: isDismissible,
  //     enableDrag: isDrag,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(radius.r),
  //         topRight: Radius.circular(radius.r),
  //       ),
  //     ),
  //     isScrollControlled: true,
  //     constraints: BoxConstraints(
  //       maxHeight: MediaQuery.of(context).size.height - paddingTop.r,
  //     ),
  //     backgroundColor: Style.transparent,
  //     context: context,
  //     builder: (context) => BlurWrap(
  //       key: key,
  //       radius: BorderRadius.only(
  //         topRight: Radius.circular(12.r),
  //         topLeft: Radius.circular(12.r),
  //       ),
  //       child: Container(
  //         margin:
  //             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //         // padding:
  //         //     EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
  //         decoration: BoxDecoration(
  //           color: Style.white.withOpacity(0.9),
  //           borderRadius: BorderRadius.only(
  //             topRight: Radius.circular(12.r),
  //             topLeft: Radius.circular(12.r),
  //           ),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Style.blackColor.withOpacity(0.25),
  //               blurRadius: 40,
  //               spreadRadius: 0,
  //               offset: const Offset(0, -2),
  //             ),
  //           ],
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Container(
  //               height: 4.h,
  //               width: 48.w,
  //               decoration: BoxDecoration(
  //                 color: Style.bottomSheetIconColor,
  //                 borderRadius: BorderRadius.circular(40.r),
  //               ),
  //               margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
  //             ),
  //             isExpanded ? Expanded(child: modal) : modal,
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
          ),
          contentPadding: EdgeInsets.all(16.r),
          iconPadding: EdgeInsets.zero,
          content: child,
        );
      },
    );
  }
}
