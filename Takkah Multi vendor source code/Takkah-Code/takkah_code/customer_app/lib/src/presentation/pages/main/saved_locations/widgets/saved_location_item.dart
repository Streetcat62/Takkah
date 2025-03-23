import 'dart:io';
import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'delivery_address_modal.dart';
import '../../../../theme/theme.dart';
import '../../../../../models/models.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/constants/constants.dart';

class SavedLocationItem extends StatelessWidget {
  final LocalAddressData address;
  final Map<MarkerId, Marker> markers;
  final VoidCallback onDelete;
  final VoidCallback onMakeDefault;

  const SavedLocationItem({
    Key? key,
    required this.address,
    required this.markers,
    required this.onDelete,
    required this.onMakeDefault,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.mainAppbarBack(),
            borderRadius: Platform.isAndroid
                ? BorderRadius.circular(10.r)
                : BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r),
                  ),
          ),
          padding: REdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    InkWell(
                      onTap: onMakeDefault,
                      child: Container(
                        width: 40.r,
                        height: 40.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: (address.isSelected ?? false)
                              ? AppColors.green
                              : AppColors.mainBackground(),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.mainAppbarShadow(),
                              offset: const Offset(0, 1),
                              blurRadius: 2,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          FlutterRemix.navigation_fill,
                          color: (address.isSelected ?? false)
                              ? AppColors.white
                              : AppColors.iconAndTextColor(),
                          size: 20.r,
                        ),
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            paddingTop: 150,
                            modal: DeliveryAddressModal(
                              address: address,
                              markers: markers,
                              onMakeDefault: onMakeDefault,
                              onDelete: onDelete,
                            ),
                            radius: 16,
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${address.title}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                letterSpacing: -0.4,
                                color: AppColors.iconAndTextColor(),
                              ),
                            ),
                            6.verticalSpace,
                            Text(
                              address.address ?? '',
                              maxLines: 2,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.secondaryIconTextColor(),
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              LocalStorage.instance.getLocalAddressesList().length < 2
                  ? (Platform.isAndroid
                      ? Icon(
                          FlutterRemix.arrow_right_s_line,
                          size: 20.r,
                          color: AppColors.iconAndTextColor(),
                        )
                      : const SizedBox.shrink())
                  : (Platform.isAndroid
                      ? Icon(
                          FlutterRemix.arrow_right_s_line,
                          size: 20.r,
                          color: AppColors.iconAndTextColor(),
                        )
                      : GestureDetector(
                          child: Icon(
                            FlutterRemix.more_2_line,
                            size: 22.r,
                            color: AppColors.iconAndTextColor(),
                          ),
                          onTapDown: (TapDownDetails details) {
                            final left = details.globalPosition.dx;
                            final right = details.globalPosition.dy;
                            showMenu(
                              context: context,
                              color: AppColors.mainAppbarBack(),
                              position: RelativeRect.fromLTRB(
                                left.r,
                                right.r + 20.r,
                                20.r,
                                0,
                              ),
                              items: [
                                PopupMenuItem(
                                  height: 25.r,
                                  textStyle: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: AppColors.iconAndTextColor(),
                                    letterSpacing: -0.2,
                                  ),
                                  onTap: onMakeDefault,
                                  child: Padding(
                                    padding:
                                        REdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      AppHelpers.getTranslation(
                                          TrKeys.makeDefaultAddress),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  height: 25.r,
                                  textStyle: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: AppColors.red,
                                    letterSpacing: -0.2,
                                  ),
                                  onTap: onDelete,
                                  child: Padding(
                                    padding:
                                        REdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      AppHelpers.getTranslation(TrKeys.delete),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
            ],
          ),
        ),
        if (!Platform.isAndroid)
          SizedBox(
            height: 154.r,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
              child: GoogleMap(
                zoomControlsEnabled: false,
                tiltGesturesEnabled: false,
                compassEnabled: false,
                mapToolbarEnabled: false,
                myLocationButtonEnabled: false,
                markers: Set<Marker>.of(markers.values),
                initialCameraPosition: CameraPosition(
                  bearing: 0,
                  target: LatLng(
                    address.location?.latitude ??
                        (AppHelpers.getInitialLatitude() ??
                            AppConstants.demoLatitude),
                    address.location?.longitude ??
                        (AppHelpers.getInitialLongitude() ??
                            AppConstants.demoLongitude),
                  ),
                  tilt: 0,
                  zoom: 17,
                ),
                gestureRecognizers: {
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  )
                },
                onMapCreated: (controller) {
                  controller.setMapStyle(json.encode(AppMapThemes.mapTheme()));
                },
              ),
            ),
          ),
        20.verticalSpace,
      ],
    );
  }
}
