
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'local_storage.dart';
import '../../models/models.dart';
import '../constants/constants.dart';
import '../../presentation/theme/theme.dart';

class AppHelpers {
  AppHelpers._();

  static List<OrderItemWidgetStatus> getWidgetStatuses(String? status) {
    switch (status) {
      case 'new':
        return [
          OrderItemWidgetStatus.current,
          OrderItemWidgetStatus.notYet,
          OrderItemWidgetStatus.notYet,
          OrderItemWidgetStatus.notYet,
          OrderItemWidgetStatus.notYet,
        ];
      case 'accepted':
        return [
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.current,
          OrderItemWidgetStatus.notYet,
          OrderItemWidgetStatus.notYet,
          OrderItemWidgetStatus.notYet,
        ];
      case 'ready':
        return [
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.current,
          OrderItemWidgetStatus.notYet,
          OrderItemWidgetStatus.notYet,
        ];
      case 'on_a_way':
        return [
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.current,
          OrderItemWidgetStatus.notYet,
        ];
      case 'delivered':
        return [
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.current,
        ];
      default:
        return [
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.completed,
          OrderItemWidgetStatus.completed,
        ];
    }
  }

  static DateTime getMinTime(String openTime) {
    final int openHour = int.parse(openTime.substring(3, 5)) == 0
        ? int.parse(openTime.substring(0, 2))
        : int.parse(openTime.substring(0, 2)) + 1;
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, openHour);
  }

  static DateTime getMaxTime(String closeTime) {
    final int closeHour = int.parse(closeTime.substring(0, 2));
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, closeHour);
  }

  static List<ShopDelivery> getDeliveries(List<ShopDelivery> deliveries) {
    final List<ShopDelivery> shopDeliveries = [];
    for (final delivery in deliveries) {
      if (delivery.type != 'pickup') {
        shopDeliveries.add(delivery);
      }
    }
    return shopDeliveries;
  }

  static bool hasPickup(List<ShopDelivery> deliveries) {
    for (final delivery in deliveries) {
      if (delivery.type == 'pickup') {
        return true;
      }
    }
    return false;
  }

  static int getProductsCountInCart(CartData? cartData) {
    if (cartData == null || (cartData.userCarts?.isEmpty ?? false)) {
      return 0;
    }
    int count = 0;
    for (final userCarts in (cartData.userCarts ?? <UserCartData>[])) {
      if (userCarts.cartDetails == null ||
          (userCarts.cartDetails?.isEmpty ?? false)) {
        continue;
      }
      count += (userCarts.cartDetails?.length ?? 0);
    }
    return count;
  }

  static bool checkProductsCount (List<UserCartData>? userCartData) {

    for (var element in userCartData ?? []) {

      if(element.cartDetails.isNotEmpty){
        return true;
      }
    }
    return false;
  }

  static int getProductCartCount(
    CartData? cartData,
    ProductData? productData,
  ) {
    if (cartData == null || (cartData.userCarts?.isEmpty ?? false)) {
      return 0;
    }
    for (final userCarts in (cartData.userCarts ?? <UserCartData>[])) {
      if (userCarts.cartDetails == null ||
          (userCarts.cartDetails?.isEmpty ?? false)) {
        continue;
      }
      for (final cartDetail in (userCarts.cartDetails ?? <CartDetails>[])) {
        if (cartDetail.product?.id == productData?.id) {
          return cartDetail.quantity ?? 0;
        }
      }
    }
    return 0;
  }

  static List<String> getDeliveryTimes(String? openTime, String? closeTime) {
    List<String> hours = [];
    final int openHour = int.parse(openTime?.substring(3, 5) ?? '') == 0
        ? int.parse(openTime?.substring(0, 2) ?? '')
        : int.parse(openTime?.substring(0, 2) ?? '') + 1;
    final int closeHour = int.parse(closeTime?.substring(0, 2) ?? '');
    for (int i = openHour; i < closeHour; i++) {
      hours.add('$i:00 - ${i + 1}:00');
    }
    return hours;
  }


  static void showAlertDialog({
    required BuildContext context,
    required Widget child,
    double radius = 16,
  }) {
    AlertDialog alert = AlertDialog(
      backgroundColor: AppColors.mainAppbarBack(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius.r),
        ),
      ),
      iconPadding: EdgeInsets.zero,
      content: child,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static String getDeliveryTypeText(List<ShopDelivery>? deliveries) {
    if (deliveries == null || deliveries.isEmpty) {
      return getTranslation(TrKeys.noDeliveryType);
    }
    for (final delivery in deliveries) {
      if (delivery.type == 'pickup') {
        if (deliveries.length > 1) {
          return '${getTranslation(TrKeys.delivery)} - ${getTranslation(TrKeys.pickup)}';
        }
        return getTranslation(TrKeys.pickup);
      }
    }
    return getTranslation(TrKeys.delivery);
  }

  static num? getDeliveryFee(List<ShopDelivery>? deliveries) {
    if (deliveries == null || deliveries.isEmpty) {
      return 0;
    }
    for (final delivery in deliveries) {
      if (delivery.type != 'pickup') {
        return delivery.price;
      }
    }
    return 0;
  }

  static bool checkHasPickup(List<ShopDelivery>? deliveries) {
    if (deliveries == null || deliveries.isEmpty) {
      return false;
    }
    for (final delivery in deliveries) {
      if (delivery.type == 'pickup') {
        return true;
      }
    }
    return false;
  }

  static bool checkHasDelivery(List<ShopDelivery>? deliveries) {
    if (deliveries == null || deliveries.isEmpty) {
      return false;
    }
    for (final delivery in deliveries) {
      if (delivery.type != 'pickup') {
        return true;
      }
    }
    return false;
  }

  static num getPercent(String rating, Map<String, dynamic>? percentMap) {
    if (percentMap == null || percentMap.isEmpty) {
      return 0;
    }
    for (final value in percentMap.keys) {
      if (rating == value) {
        return percentMap[value];
      }
    }
    return 0;
  }

  static bool isLikedProduct(int? id) {
    final List<LocalProductData> likedProducts =
        LocalStorage.instance.getLikedProductsList();
    for (final product in likedProducts) {
      if (product.productId == id) {
        return true;
      }
    }
    return false;
  }

  static LocalAddressData? getActiveLocalAddress() {
    final List<LocalAddressData> localAddresses =
        LocalStorage.instance.getLocalAddressesList();
    for (final address in localAddresses) {
      if (address.isSelected == true) {
        return address;
      }
    }
    return null;
  }

  static String? getGoogleMapKey() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'google_map_key') {
        return setting.key;
      }
    }
    return null;
  }

  static int getProfileInfoPercentage() {
    final UserData? user = LocalStorage.instance.getUser();
    if (user == null) {
      return 0;
    }
    int percent = 0;
    if (user.firstname != null) {
      percent += 14;
    }
    if (user.lastname != null) {
      percent += 14;
    }
    if (user.phone != null) {
      percent += 14;
    }
    if (user.email != null) {
      percent += 14;
    }
    if (user.birthday != null) {
      percent += 14;
    }
    if (user.gender != null) {
      percent += 14;
    }
    if (user.img != null) {
      percent += 16;
    }
    return percent;
  }

  static void showCustomModalBottomSheet({
    required BuildContext context,
    required Widget modal,
    int paddingTop = 200,
    Color? background,
    int? radius,
  }) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular((radius ?? 8).r),
          topRight: Radius.circular((radius ?? 8).r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - paddingTop.r,
      ),
      backgroundColor: background ?? AppColors.mainBackground(),
      context: context,
      builder: (_) => modal,
    );
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

  static String checkWorkDate(List<ShopWorkingDay>? shopWorkingDay) {
    String weekDayString = '';
    DateTime dateTime = DateTime.now();
    DateFormat weekdayFormat = DateFormat('EEEE');
    String weekday = weekdayFormat.format(dateTime);
    if(shopWorkingDay?.isNotEmpty ?? false) {
    var res = shopWorkingDay?.firstWhere((element) =>
    element.day.toLowerCase() == weekday.toLowerCase());
    weekDayString = "${res?.from ?? 0} - ${res?.to ?? 0}";}
    return shopWorkingDay?.isEmpty ?? false ? '00:45 - 23:00' : weekDayString;
  }

  static bool checkCloseDay (List<ShopClosedDay>? shopClosedDay, DateTime value) {
    if (shopClosedDay == []) {
      return false;
    }
      String day =  DateFormat('yyyy-MM-dd').format(value);
      bool closeDay = false;
      shopClosedDay?.firstWhere((element) {
        if(element.day == day) {
          closeDay = true;
        }
        return closeDay;
      });
      return closeDay;

  }

  static bool checkIsSvg(String? url) {
    if (url == null) {
      return false;
    }
    final length = url.length;
    return url.substring(length - 3, length) == 'svg';
  }

  static String? getAppName() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'title') {
        return setting.value;
      }
    }
    return 'Sundaymart';
  }

  static showCheckFlash(BuildContext context, String text) {
    return showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      builder: (BuildContext context, FlashController controller) {
        return Flash(
          controller: controller,
          backgroundColor: AppColors.mainBackground(),
          position: FlashPosition.top,
          borderRadius: BorderRadius.circular(8.r),
          behavior: FlashBehavior.floating,
          margin: REdgeInsets.all(15),
          brightness: Brightness.light,
          barrierBlur: 1.5.r,
          barrierColor: AppColors.mainAppbarShadow(),
          barrierDismissible: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.unratedIcon(),
                width: 2.r,
              ),
            ),
            child: Padding(
              padding: REdgeInsets.all(15),
              child: Text(
                text,
                style: GoogleFonts.inter(
                  color: AppColors.iconAndTextColor(),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
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
}


