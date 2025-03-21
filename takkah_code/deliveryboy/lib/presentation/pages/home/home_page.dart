import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../pages.dart';
import '../../../main.dart';
import '../../styles/style.dart';
import 'delivery_bottom_sheet.dart';
import 'default_home_bottom_sheet.dart';
import '../../component/components.dart';
import '../../routes/app_router.gr.dart';
import '../../../application/providers.dart';
import '../push_order/new_order_alert_dialog.dart';
import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/services/services.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  final bool isLtr = LocalStorage.instance.getLangLtr();
  GoogleMapController? _googleMapController;
  BitmapDescriptor myIcon = BitmapDescriptor.defaultMarker;
  OrderDetailData? push;
  Timer? timer;
  LatLng latLng = LatLng(
    (LocalStorage.instance.getAddressSelected()?.latitude ??
        AppConstants.demoLatitude),
    (LocalStorage.instance.getAddressSelected()?.longitude ??
        AppConstants.demoLongitude),
  );
  Position? currentLocation;
  dynamic check;
  final _delayed = Delayed(milliseconds: 36000);
  late ValueNotifier<bool> _toggleController;

  Future<void> _checkLocation() async {
    check = await _geolocatorPlatform.checkPermission();
    if (check == LocationPermission.denied) {
      check = await Geolocator.requestPermission();
      if (check != LocationPermission.denied &&
          check != LocationPermission.deniedForever) {
        var loc = await Geolocator.getCurrentPosition();
        latLng = LatLng(loc.latitude, loc.longitude);
        LocalStorage.instance.setAddressSelected(latLng);
        _googleMapController
            ?.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
      }
    } else {
      if (check != LocationPermission.deniedForever) {
        var loc = await Geolocator.getCurrentPosition();
        latLng = LatLng(loc.latitude, loc.longitude);
        LocalStorage.instance.setAddressSelected(latLng);
        _googleMapController
            ?.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
      }
    }
  }

  Future<void> _setCustomMarkerIcon() async {
    final Uint8List markerMyIcon =
        await AppHelpers.getBytesFromAsset(AppAssets.pngMyLocation, 120);
    myIcon = BitmapDescriptor.fromBytes(markerMyIcon);
  }

  Future<void> _checkFirebaseMessaging() async {
    FirebaseMessaging.instance.requestPermission(
      sound: true,
      alert: true,
      badge: false,
    );
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        log(jsonEncode(message.data));
        if (message.data['id'] != null) {
          AppHelpers.showCheckTopSnackBarInfo(
            context,
            '${AppHelpers.getTranslation(TrKeys.id)} #${message.notification?.title} ${message.notification?.body}',
          );
        }
        if (jsonDecode(message.data['order'])['type'] == 'new_order') {
          _attachOrder(jsonDecode(message.data['order']));
        } else if (jsonDecode(message.data['order'])['type'] == 'deliveryman') {
          _newOrder(jsonDecode(message.data['order']));
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        if (jsonDecode(message.data['order'])['type'] == 'new_order') {
          _attachOrder(jsonDecode(message.data['order']));
        } else if (jsonDecode(message.data['order'])['type'] == 'deliveryman') {
          _newOrder(jsonDecode(message.data['order']));
        }
      },
    );
  }

  Future<void> _getMyLocation() async {
    if (check == LocationPermission.denied) {
      check = await Geolocator.requestPermission();
      if (check != LocationPermission.denied &&
          check != LocationPermission.deniedForever) {
        var loc = await Geolocator.getCurrentPosition();
        latLng = LatLng(loc.latitude, loc.longitude);
        LocalStorage.instance.setAddressSelected(latLng);
        _googleMapController!
            .animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
      }
    } else {
      if (check != LocationPermission.deniedForever) {
        var loc = await Geolocator.getCurrentPosition();
        latLng = LatLng(loc.latitude, loc.longitude);
        LocalStorage.instance.setAddressSelected(latLng);
        _googleMapController
            ?.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
      }
    }
  }

  void _getSetProgressLocation() {
    timer = Timer.periodic(
      const Duration(seconds: 10),
      (Timer t) {
        ref.read(homeProvider.notifier).getRouting(
              context: context,
              start: latLng,
              isOnline: (LocalStorage.instance.getOnline()),
            );
        _googleMapController
            ?.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
      },
    );
  }

  Future<void> _getCurrentLocation() async {
    _getSetProgressLocation();
    _geolocatorPlatform.getCurrentPosition().then(
      (location) {
        currentLocation = location;
        latLng = LatLng(
          currentLocation?.latitude ?? latLng.latitude,
          currentLocation?.longitude ?? latLng.longitude,
        );
      },
    );
    _geolocatorPlatform.getPositionStream().listen(
      (newLoc) {
        currentLocation = newLoc;
        latLng = LatLng(
          currentLocation?.latitude ?? latLng.latitude,
          currentLocation?.longitude ?? latLng.longitude,
        );
        _delayed.run(
          () {
            LocalStorage.instance.setAddressSelected(
              LatLng(
                currentLocation?.latitude ?? latLng.latitude,
                currentLocation?.longitude ?? latLng.longitude,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _attachOrder(Map<String, dynamic> data) async {
    push = OrderDetailData.fromJson(data);
    AppHelpers.showAlertDialog(
      context: context,
      child:
          PushedOrderModal(order: push ?? OrderDetailData(), isActive: true),
    );
    // ref
    //     .read(homeProvider.notifier)
    //     .goMarket(context: context, orderId: (push?.id ?? 0).toString());
    ref
        .read(homeProvider.notifier)
        .getRoutingAll(context, order: push ?? OrderDetailData());
  }

  Future<void> _newOrder(Map<String, dynamic> data) async {
    push = OrderDetailData.fromJson(data);
    AppHelpers.showAlertDialog(
      context: context,
      child: NewOrderAlertDialog(orderId: push?.id),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkFirebaseMessaging();
    _setCustomMarkerIcon();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(profileSettingsProvider.notifier)
            .fetchProfileStatistics(context);
        ref.read(orderProvider.notifier).initialFetchActiveOrders(
              context,
              setActiveOrder: (order) {
                ref
                  .read(homeProvider.notifier)
                  .setCurrentActiveOrder(context, order: order);
              },
            );
      },
    );
    if (LocalStorage.instance.getOnline()) {
      Workmanager().registerPeriodicTask(
        '${DateTime.now().year}${DateTime.now().day}${DateTime.now().minute}${DateTime.now().second}',
        fetchBackground,
        frequency: const Duration(minutes: 10),
      );
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _getCurrentLocation(),
      );
    }
    _toggleController = ValueNotifier(LocalStorage.instance.getOnline());
    _toggleController.addListener(
      () => ref.read(onlineProvider.notifier).setOnline(
        context,
        _toggleController,
        success: () {
          if (_toggleController.value) {
            Workmanager().registerPeriodicTask(
              '${DateTime.now().year}${DateTime.now().day}${DateTime.now().minute}${DateTime.now().second}',
              fetchBackground,
              frequency: const Duration(minutes: 10),
            );
            _getCurrentLocation();
          } else {
            timer?.cancel();
            Workmanager().cancelAll();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _toggleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(homeProvider);
            final notifier = ref.read(homeProvider.notifier);
            return Stack(
              children: [
                _map(context, ref),
                state.isGoRestaurant || state.isGoUser
                    ? DeliverBottomSheetScreen(
                        order: state.orderDetail ?? OrderDetailData(),
                      )
                    : DefaultHomeBottomSheet(isScrolling: state.isScrolling),
                state.isGoRestaurant || state.isGoUser
                    ? const SizedBox.shrink()
                    : _myFindButton(ref),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  top: MediaQuery.of(context).padding.top + 10.h,
                  left: state.isScrolling ? -64.w : 16.w,
                  child: ButtonsBouncingEffect(
                    child: GestureDetector(
                      onTap: () => context.pushRoute(const ProfileRoute()),
                      child: Hero(
                        tag: AppConstants.heroTagProfileAvatar,
                        child: Consumer(
                          builder: (context, ref, child) {
                            ref.watch(profileImageProvider);
                            return DriverAvatar(
                              imageUrl: LocalStorage.instance.getUser()?.img,
                              rate: LocalStorage.instance.getUser()?.rate,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  top: MediaQuery.of(context).padding.top + 80.h,
                  left: state.isScrolling ? -64.w : 12.w,
                  child: ButtonsBouncingEffect(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Style.primaryColor,
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                      margin: EdgeInsets.all(8.r),
                      child: IconButton(
                        onPressed: () async {
                          await context.pushRoute(const OrdersRoute());
                          notifier.updateState(ref.watch(orderProvider).totalActiveOrder);
                        },
                        icon: Text(
                          ref.watch(orderProvider).totalActiveOrder.toString(),
                          style: Style.interBold(
                            color: Style.white,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  top: MediaQuery.of(context).padding.top + 10.h,
                  right: state.isScrolling ? -120.w : 16.w,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Style.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.all(6.r),
                    child: Consumer(
                      builder: (context, ref, child) => RedesignedToggle(
                        isOnline: LocalStorage.instance.getOnline(),
                        controller: _toggleController,
                        isLoading: ref.watch(onlineProvider).isLoading,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _map(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(
          bearing: 0,
          target: LatLng(
            (LocalStorage.instance.getAddressSelected()?.latitude ??
                AppConstants.demoLatitude),
            (LocalStorage.instance.getAddressSelected()?.longitude ??
                AppConstants.demoLongitude),
          ),
          tilt: 0,
          zoom: 17,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('source'),
            icon: myIcon,
            position: LatLng(
              currentLocation?.latitude ?? latLng.latitude,
              currentLocation?.longitude ?? latLng.longitude,
            ),
          ),
          ...state.markers
        },
        polylines: state.isGoRestaurant || state.isGoUser
            ? {
                Polyline(
                  polylineId: const PolylineId('startLocation'),
                  points: state.endPolylineCoordinates,
                  color: Style.primaryColor.withOpacity(0.4),
                  width: 6,
                ),
                Polyline(
                  polylineId: const PolylineId('market'),
                  points: state.polylineCoordinates,
                  color: Style.primaryColor,
                  width: 6,
                ),
              }
            : {},
        mapToolbarEnabled: true,
        zoomControlsEnabled: false,
        onMapCreated: (controller) {
          _googleMapController = controller;
          _checkLocation();
          _getMyLocation();
        },
        onCameraMoveStarted: () {
          if (!(LocalStorage.instance.getUser()?.active ?? false)) {
            ref.read(homeProvider.notifier).scrolling(true);
          }
        },
        onCameraIdle: () => _delayed
            .run(() => ref.read(homeProvider.notifier).scrolling(false)),
        padding: EdgeInsets.only(
          bottom: state.isGoRestaurant
              ? 90.h
              : state.isScrolling
                  ? 60.h
                  : 330.h,
        ),
      ),
    );
  }

  Widget _myFindButton(WidgetRef ref) {
    return AnimatedPositioned(
      bottom: 342.h,
      right: ref.watch(homeProvider).isScrolling ? -64.w : 16.w,
      duration: const Duration(milliseconds: 400),
      child: ButtonsBouncingEffect(
        child: GestureDetector(
          onTap: _getMyLocation,
          child: Container(
            width: 50.r,
            height: 50.r,
            decoration: BoxDecoration(
              color: Style.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Style.shadowColor,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(FlutterRemix.focus_3_fill),
          ),
        ),
      ),
    );
  }
}
