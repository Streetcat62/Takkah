import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../theme/theme.dart';
import '../../../../../models/models.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';

class DeliveryAddressModal extends StatelessWidget {
  final LocalAddressData address;
  final Map<MarkerId, Marker> markers;
  final VoidCallback onDelete;
  final VoidCallback onMakeDefault;

  const DeliveryAddressModal({
    Key? key,
    required this.address,
    required this.markers,
    required this.onDelete,
    required this.onMakeDefault,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        color: AppColors.mainAppbarBack(),
      ),
      padding: REdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: ModalDrag(),
          ),
          24.verticalSpace,
          Text(
            '${address.title}',
            style: GoogleFonts.inter(
              color: AppColors.iconAndTextColor(),
              fontSize: 16.sp,
              letterSpacing: -0.4,
              fontWeight: FontWeight.w600,
            ),
          ),
          12.verticalSpace,
          Text(
            '${address.address}',
            style: GoogleFonts.inter(
              color: AppColors.iconAndTextColor(),
              fontSize: 14.sp,
              letterSpacing: -0.4,
              fontWeight: FontWeight.w400,
            ),
          ),
          24.verticalSpace,
          SizedBox(
            height: 400.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: GoogleMap(
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                mapToolbarEnabled: false,
                compassEnabled: false,
                tiltGesturesEnabled: false,
                markers: Set<Marker>.of(markers.values),
                gestureRecognizers: {
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  )
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    address.location?.latitude ??
                        (AppHelpers.getInitialLatitude() ??
                            AppConstants.demoLatitude),
                    address.location?.longitude ??
                        (AppHelpers.getInitialLongitude() ??
                            AppConstants.demoLongitude),
                  ),
                  zoom: 17,
                ),
                onMapCreated: (controller) {
                  controller.setMapStyle(json.encode(AppMapThemes.mapTheme()));
                },
              ),
            ),
          ),
          24.verticalSpace,
          LocalStorage.instance.getLocalAddressesList().length == 1
              ? CustomOutlinedButton(
                  title: AppHelpers.getTranslation(TrKeys.close),
                  onTap: context.popRoute,
                )
              : Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        title: AppHelpers.getTranslation(TrKeys.delete),
                        onTap: () {
                          context.popRoute();
                          onDelete();
                        },
                      ),
                    ),
                    6.horizontalSpace,
                    Expanded(
                      child: MainConfirmButton(
                        title: AppHelpers.getTranslation(
                            TrKeys.makeDefaultAddress),
                        fontSize: 14,
                        onTap: () {
                          context.popRoute();
                          onMakeDefault();
                        },
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
