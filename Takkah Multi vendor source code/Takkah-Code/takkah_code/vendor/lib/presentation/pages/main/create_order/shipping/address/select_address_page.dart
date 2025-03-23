import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderfoodyman/presentation/pages/main/create_order/shipping/address/searched_location_item.dart';
import 'package:venderfoodyman/presentation/pages/main/create_order/shipping/address/widgets/add_title_dialog.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';
import '../../../../../component/components.dart';
import '../../../../../styles/style.dart';

class SelectAddressPage extends StatefulWidget {
  const SelectAddressPage({Key? key}) : super(key: key);

  @override
  State<SelectAddressPage> createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  CameraPosition? _cameraPosition;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        backgroundColor: Style.greyColor,
        resizeToAvoidBottomInset: false,
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(selectAddressProvider);
            final event = ref.read(selectAddressProvider.notifier);
            return Stack(
              children: [
                GoogleMap(
                  tiltGesturesEnabled: false,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    bearing: 0,
                    target: LatLng(
                      AppHelpers.getInitialLatitude() ??
                          AppConstants.demoLatitude,
                      AppHelpers.getInitialLongitude() ??
                          AppConstants.demoLongitude,
                    ),
                    tilt: 0,
                    zoom: 17,
                  ),
                  onMapCreated: (controller) {
                    event.setMapController(controller);
                  },
                  onCameraMoveStarted: () {
                    _animationController.repeat(
                      min: AppConstants.pinLoadingMin,
                      max: AppConstants.pinLoadingMax,
                      period: _animationController.duration! *
                          (AppConstants.pinLoadingMax -
                              AppConstants.pinLoadingMin),
                    );
                    event.setChoosing(true);
                  },
                  onCameraIdle: () {
                    event.fetchLocationName(_cameraPosition?.target);
                    _animationController.forward(
                      from: AppConstants.pinLoadingMax,
                    );
                    event.setChoosing(false);
                  },
                  onCameraMove: (cameraPosition) {
                    _cameraPosition = cameraPosition;
                  },
                ),
                IgnorePointer(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 78.0,
                      ),
                      child: lottie.Lottie.asset(
                        AppAssets.lottiePin,
                        onLoaded: (composition) {
                          _animationController.duration = composition.duration;
                        },
                        controller: _animationController,
                        width: 250,
                        height: 250,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    54.verticalSpace,
                    Container(
                      height: 50.r,
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      margin: REdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Style.bgColor,
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            spreadRadius: 0,
                          ),
                        ],
                        color: Style.white,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            FlutterRemix.search_line,
                            size: 20.r,
                            color: Style.iconsColor,
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: TextFormField(
                              controller: state.textController,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Style.iconsColor,
                                letterSpacing: -0.5,
                              ),
                              onChanged: (value) {
                                event.setQuery(context);
                              },
                              cursorWidth: 1.r,
                              cursorColor: Style.blackColor,
                              decoration: InputDecoration.collapsed(
                                hintText:
                                    AppHelpers.trans(TrKeys.searchLocation),
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: Style.iconColor,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: event.clearSearchField,
                            splashRadius: 20.r,
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              FlutterRemix.close_line,
                              size: 20.r,
                              color: Style.iconsColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (state.isSearching)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Style.white,
                        ),
                        margin:
                            REdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        padding:
                            REdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: state.isSearchLoading
                            ? const LoadingList(
                                itemHeight: 60,
                                itemCount: 5,
                              )
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.searchedPlaces.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return SearchedLocationItem(
                                    place: state.searchedPlaces[index],
                                    isLast: state.searchedPlaces.length - 1 ==
                                        index,
                                    onTap: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      event.goToLocation(
                                        place: state.searchedPlaces[index],
                                      );
                                    },
                                  );
                                },
                              ),
                      ),
                  ],
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  bottom: state.isChoosing ? -60.r : 20.r,
                  left: 15.r,
                  right: 15.r,
                  child: Row(
                    children: [
                      const PopButton(
                        heroTag: AppConstants.heroTagAddOrderButton,
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Consumer(
                          builder: (context, ref, child) {
                            return CustomButton(
                              title: AppHelpers.trans(TrKeys.confirmLocation),
                              onPressed: state.location == null
                                  ? null
                                  : () {
                                      ref.read(orderAddressProvider.notifier)
                                        ..setLocation(
                                          title:
                                              state.textController?.text ?? '',
                                          location: state.location,
                                        )
                                        ..setNewAddress();

                                      showDialog(
                                          context: context,
                                          builder: (_) => Dialog(
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.r),
                                                    child:
                                                        const AddTitleDialog()),
                                              ));
                                    },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  bottom: 89.r,
                  right: state.isChoosing ? -60.r : 15.r,
                  child: CustomIconButton(
                    iconData: FlutterRemix.navigation_fill,
                    size: 60,
                    onTap: event.findMyLocation,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
