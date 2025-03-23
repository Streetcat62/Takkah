import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sundaymart/src/models/data/local_address_data.dart';
import 'package:sundaymart/src/models/data/local_location_data.dart';

import '../../../theme/theme.dart';
import '../../main/saved_locations/riverpod/provider/saved_locations_provider.dart';
import 'widgets/my_location_button.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import 'widgets/searched_location_item.dart';
import 'widgets/enter_location_title_modal.dart';
import '../../../../core/constants/constants.dart';
import 'riverpod/provider/add_address_provider.dart';

class AddAddressPage extends ConsumerStatefulWidget {
  final bool isRequired;

  const AddAddressPage({Key? key, required this.isRequired}) : super(key: key);

  @override
  ConsumerState<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends ConsumerState<AddAddressPage>
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
    final state = ref.watch(addAddressProvider);
    final checkState = ref.watch(savedLocationsProvider);
    final notifier = ref.read(addAddressProvider.notifier);
    final checkNotifier = ref.read(savedLocationsProvider.notifier);
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor: AppColors.mainBackground(),
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              GoogleMap(
                tiltGesturesEnabled: false,
                myLocationButtonEnabled: false,
                onTap: notifier.goToTappedLocation,
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
                  controller.setMapStyle(
                    json.encode(AppMapThemes.mapTheme()),
                  );
                  notifier.setMapController(controller);
                },
                onCameraMoveStarted: () {
                  _animationController.repeat(
                    min: AppConstants.pinLoadingMin,
                    max: AppConstants.pinLoadingMax,
                    period: _animationController.duration! *
                        (AppConstants.pinLoadingMax -
                            AppConstants.pinLoadingMin),
                  );
                  notifier.setChoosing(true);
                },
                onCameraIdle: () {

                  checkNotifier.checkNewLocation(
                      addressData: LocalAddressData(
                      location: LocalLocationData(
                          latitude: _cameraPosition?.target.latitude,
                          longitude: _cameraPosition?.target.longitude
                      )
                  ));

                    notifier.fetchLocationName(
                      _cameraPosition?.target ??
                          LatLng(
                            AppHelpers.getInitialLatitude() ??
                                AppConstants.demoLatitude,
                            AppHelpers.getInitialLongitude() ??
                                AppConstants.demoLongitude,
                          ),
                    );


                  _animationController.forward(
                    from: AppConstants.pinLoadingMax,
                  );
                  notifier.setChoosing(false);
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
                  53.verticalSpace,
                  Row(
                    children: [
                      16.horizontalSpace,
                      if (!widget.isRequired)
                        MyLocationButton(
                          iconData: FlutterRemix.arrow_left_s_line,
                          width: 50,
                          onTap: context.popRoute,
                        ),
                      6.horizontalSpace,
                      Expanded(
                        child: Container(
                          height: 50.r,
                          padding: REdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: AppColors.mainAppbarShadow(),
                                offset: const Offset(0, 2),
                                blurRadius: 2,
                                spreadRadius: 0,
                              ),
                            ],
                            color: AppColors.mainAppbarBack(),
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                FlutterRemix.search_line,
                                size: 20.r,
                                color: AppColors.iconAndTextColor(),
                              ),
                              12.horizontalSpace,
                              Expanded(
                                child: TextFormField(
                                  controller: state.textController,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: AppColors.iconAndTextColor(),
                                    letterSpacing: -0.5,
                                  ),
                                  onChanged: (value) =>
                                      notifier.setQuery(context),
                                  cursorWidth: 1.r,
                                  cursorColor: AppColors.iconAndTextColor(),
                                  decoration: InputDecoration.collapsed(
                                    hintText: AppHelpers.getTranslation(
                                        TrKeys.searchLocation),
                                    hintStyle: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: AppColors.secondaryIconTextColor(),
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: notifier.clearSearchField,
                                splashRadius: 20.r,
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  FlutterRemix.close_line,
                                  size: 20.r,
                                  color: AppColors.iconAndTextColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      16.horizontalSpace,
                    ],
                  ),
                  if (state.isSearching)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColors.mainAppbarBack(),
                      ),
                      margin:
                          REdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      padding:
                          REdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: state.isSearchLoading
                          ? const MainListShimmer()
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.searchedPlaces.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return SearchedLocationItem(
                                  place: state.searchedPlaces[index],
                                  isLast: state.searchedPlaces.length - 1 == index,
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    notifier.goToLocation(
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
                child: MainConfirmButton(
                  isLoading: checkState.isNewLoading,
                  title: checkState.isValid
                      ? AppHelpers.getTranslation(TrKeys.confirmLocation)
                  : "It is not valid location",
                  onTap: state.location == null || !checkState.isValid
                      ? null
                      : () {
                          AppHelpers.showAlertDialog(
                            context: context,
                            child: EnterLocationTitleModal(
                              hasBack: !widget.isRequired,
                            ),
                          );
                        },
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 150),
                bottom: 89.r,
                right: state.isChoosing ? -60.r : 15.r,
                child: MyLocationButton(
                  iconData: FlutterRemix.navigation_fill,
                  onTap: notifier.findMyLocation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
