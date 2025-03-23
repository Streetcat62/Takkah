import 'dart:convert';

import 'package:lottie/lottie.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter/foundation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../theme/theme.dart';
import 'widgets/shop_accepted_body.dart';
import 'widgets/shop_rejected_body.dart';
import 'widgets/shop_under_review_body.dart';
import '../../../../../core/utils/utils.dart';
import 'widgets/select_shop_images_button.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import 'riverpod/provider/become_seller_provider.dart';
import 'riverpod/provider/profile_in_become_seller_provider.dart';

class BecomeSellerPage extends ConsumerStatefulWidget {
  const BecomeSellerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BecomeSellerPage> createState() => _BecomeSellerPageState();
}

class _BecomeSellerPageState extends ConsumerState<BecomeSellerPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  CameraPosition? _cameraPosition;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) =>
          ref.read(profileInBecomeSellerProvider.notifier).fetchProfileDetails(
                checkYourNetwork: () => AppHelpers.showCheckFlash(
                  context,
                  AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
                ),
              ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor: AppColors.mainBackground(),
          appBar: CommonAppBar(
            title: AppHelpers.getTranslation(TrKeys.becomeSeller),
            onLeadingPressed: context.popRoute,
          ),
          body: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(profileInBecomeSellerProvider);
                return state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3.r,
                          color: AppColors.green,
                        ),
                      )
                    : state.shopStatus == ShopStatus.approved
                        ? const ShopAcceptedBody()
                        : state.shopStatus == ShopStatus.rejected
                            ? const ShopRejectedBody()
                            : state.shopStatus == ShopStatus.newShop
                                ? const ShopUnderReviewBody()
                                : SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Consumer(
                                      builder: (context, ref, child) {
                                        final notifier = ref.read(
                                            becomeSellerProvider.notifier);
                                        final sellerState =
                                            ref.watch(becomeSellerProvider);
                                        return Form(
                                          key: _formKey,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              26.verticalSpace,
                                              Text(
                                                AppHelpers.getTranslation(
                                                    TrKeys.uploadImages),
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  letterSpacing: -0.4,
                                                  color: AppColors
                                                      .iconAndTextColor(),
                                                ),
                                              ),
                                              16.verticalSpace,
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                        SelectShopImagesButton(
                                                      title: AppHelpers
                                                          .getTranslation(
                                                              TrKeys.logoImage),
                                                      onChangePhoto:
                                                          notifier.setLogo,
                                                      path:
                                                          sellerState.logoPath,
                                                    ),
                                                  ),
                                                  9.horizontalSpace,
                                                  Expanded(
                                                    child:
                                                        SelectShopImagesButton(
                                                      title: AppHelpers
                                                          .getTranslation(TrKeys
                                                              .backgroundImage),
                                                      onChangePhoto: notifier
                                                          .setBackground,
                                                      path: sellerState
                                                          .backgroundPath,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              40.verticalSpace,
                                              Text(
                                                AppHelpers.getTranslation(
                                                    TrKeys.general),
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  letterSpacing: -0.4,
                                                  color: AppColors
                                                      .iconAndTextColor(),
                                                ),
                                              ),
                                              16.verticalSpace,
                                              MainInputField(
                                                title:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.name),
                                                onChange: notifier.setName,
                                                validator:
                                                    AppValidators.emptyCheck,
                                                inputAction:
                                                    TextInputAction.next,
                                              ),
                                              16.verticalSpace,
                                              MainInputField(
                                                title:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.phone),
                                                onChange: notifier.setPhone,
                                                inputType: TextInputType.phone,
                                                validator:
                                                    AppValidators.emptyCheck,
                                                inputAction:
                                                    TextInputAction.next,
                                              ),
                                              16.verticalSpace,
                                              MainInputField(
                                                title:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.description),
                                                onChange:
                                                    notifier.setDescription,
                                                validator:
                                                    AppValidators.emptyCheck,
                                                inputAction:
                                                    TextInputAction.next,
                                              ),
                                              40.verticalSpace,
                                              Text(
                                                AppHelpers.getTranslation(
                                                    TrKeys.showWorkingHours),
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  letterSpacing: -14 * 0.03,
                                                  color: AppColors
                                                      .iconAndTextColor(),
                                                ),
                                              ),
                                              16.verticalSpace,
                                              SelectDateButton(
                                                label:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.openTime),
                                                onChangeTap: () {
                                                  AppHelpers
                                                      .showCustomModalBottomSheet(
                                                    context: context,
                                                    modal: TimePickerModal(
                                                      isBecomeSeller: true,
                                                      openTime: intl.DateFormat.Hm()
                                                          .format(sellerState
                                                          .openTime ?? DateTime.now()),
                                                      onSaved:
                                                          notifier.setOpenTime,
                                                    ),
                                                  );
                                                },
                                                time:
                                                    sellerState.openTime == null
                                                        ? null
                                                        : intl.DateFormat.Hm()
                                                            .format(sellerState
                                                                .openTime!),
                                                hintText:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.selectOpenTime),
                                                iconData:
                                                    FlutterRemix.time_fill,
                                              ),
                                              16.verticalSpace,
                                              SelectDateButton(
                                                label:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.closeTime),
                                                onChangeTap: () {
                                                  AppHelpers
                                                      .showCustomModalBottomSheet(
                                                    context: context,
                                                    modal: TimePickerModal(
                                                      isBecomeSeller: true,
                                                      closeTime: intl.DateFormat.Hm()
                                                          .format(sellerState
                                                          .closeTime ?? DateTime.now()),
                                                      onSaved:
                                                          notifier.setCloseTime,
                                                    ),
                                                  );
                                                },
                                                time: sellerState.closeTime ==
                                                        null
                                                    ? null
                                                    : intl.DateFormat.Hm()
                                                        .format(sellerState
                                                            .closeTime!),
                                                hintText:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.selectCloseTime),
                                                iconData:
                                                    FlutterRemix.time_fill,
                                              ),
                                              40.verticalSpace,
                                              Text(
                                                AppHelpers.getTranslation(
                                                    TrKeys.order),
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  letterSpacing: -0.4,
                                                  color: AppColors
                                                      .iconAndTextColor(),
                                                ),
                                              ),
                                              16.verticalSpace,
                                              MainInputField(
                                                title:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.minimumAmount),
                                                onChange: notifier.setMinAmount,
                                                inputType: TextInputType.number,
                                                prefix: Text(
                                                  '${LocalStorage.instance.getSelectedCurrency()?.symbol}',
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18.sp,
                                                    letterSpacing: -0.4,
                                                    color: AppColors
                                                        .iconAndTextColor(),
                                                  ),
                                                ),
                                                validator:
                                                    AppValidators.emptyCheck,
                                                inputAction:
                                                    TextInputAction.next,
                                              ),
                                              16.verticalSpace,
                                              MainInputField(
                                                title:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.tax),
                                                onChange: notifier.setTax,
                                                inputType: TextInputType.number,
                                                suffixIcon: Icon(
                                                  FlutterRemix.percent_fill,
                                                  size: 24.r,
                                                  color: AppColors
                                                      .iconAndTextColor(),
                                                ),
                                                validator:
                                                    AppValidators.emptyCheck,
                                                inputAction:
                                                    TextInputAction.next,
                                              ),
                                              40.verticalSpace,
                                              Text(
                                                AppHelpers.getTranslation(
                                                    TrKeys.address),
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp,
                                                  letterSpacing: -0.4,
                                                  color: AppColors
                                                      .iconAndTextColor(),
                                                ),
                                              ),
                                              16.verticalSpace,
                                              MainInputField(
                                                title:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.deliveryRange),
                                                onChange:
                                                    notifier.setDeliveryRange,
                                                inputType: TextInputType.number,
                                                validator:
                                                    AppValidators.emptyCheck,
                                                suffixIcon: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'm',
                                                      style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16.sp,
                                                        letterSpacing: -0.4,
                                                        color: AppColors
                                                            .iconAndTextColor(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                inputAction:
                                                    TextInputAction.next,
                                              ),
                                              16.verticalSpace,
                                              MainInputField(
                                                title:
                                                    AppHelpers.getTranslation(
                                                        TrKeys.address),
                                                textController: sellerState
                                                    .addressController,
                                                readOnly: true,
                                                onChange: (value) {},
                                              ),
                                              16.verticalSpace,
                                              SizedBox(
                                                height: 480.r,
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                      child: GoogleMap(
                                                        zoomControlsEnabled:
                                                            false,
                                                        gestureRecognizers: {
                                                          Factory<
                                                              OneSequenceGestureRecognizer>(
                                                            () =>
                                                                EagerGestureRecognizer(),
                                                          )
                                                        },
                                                        initialCameraPosition:
                                                            CameraPosition(
                                                          target: LatLng(
                                                            AppHelpers
                                                                    .getInitialLatitude() ??
                                                                AppConstants
                                                                    .demoLatitude,
                                                            AppHelpers
                                                                    .getInitialLongitude() ??
                                                                AppConstants
                                                                    .demoLongitude,
                                                          ),
                                                          zoom: 17,
                                                        ),
                                                        onMapCreated:
                                                            (controller) {
                                                          controller
                                                              .setMapStyle(
                                                            json.encode(
                                                              AppMapThemes
                                                                  .mapTheme(),
                                                            ),
                                                          );
                                                        },
                                                        onCameraMoveStarted:
                                                            () {
                                                          _animationController
                                                              .repeat(
                                                            min: AppConstants
                                                                .pinLoadingMin,
                                                            max: AppConstants
                                                                .pinLoadingMax,
                                                            period: _animationController
                                                                    .duration! *
                                                                (AppConstants
                                                                        .pinLoadingMax -
                                                                    AppConstants
                                                                        .pinLoadingMin),
                                                          );
                                                        },
                                                        onCameraIdle: () async {
                                                          _animationController
                                                              .forward(
                                                            from: AppConstants
                                                                .pinLoadingMax,
                                                          );
                                                          notifier
                                                              .fetchLocationName(
                                                                  context,
                                                                  _cameraPosition
                                                                      ?.target);
                                                        },
                                                        onCameraMove:
                                                            (cameraPosition) {
                                                          _cameraPosition =
                                                              cameraPosition;
                                                        },
                                                      ),
                                                    ),
                                                    IgnorePointer(
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            bottom: 78.0,
                                                          ),
                                                          child: Lottie.asset(
                                                            AppAssets.lottiePin,
                                                            onLoaded:
                                                                (composition) {
                                                              _animationController
                                                                      .duration =
                                                                  composition
                                                                      .duration;
                                                            },
                                                            controller:
                                                                _animationController,
                                                            width: 250,
                                                            height: 250,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              40.verticalSpace,
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Material(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.r),
                                                      color: AppColors
                                                          .mainAppbarBack(),
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.r),
                                                        onTap: context.popRoute,
                                                        child: Container(
                                                          height: 60.r,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.r),
                                                            border: Border.all(
                                                              width: 1.r,
                                                              color: AppColors
                                                                  .iconAndTextColor(),
                                                            ),
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            AppHelpers
                                                                .getTranslation(
                                                                    TrKeys
                                                                        .cancel),
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 18.sp,
                                                              letterSpacing:
                                                                  -0.4,
                                                              color: AppColors
                                                                  .iconAndTextColor(),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  17.horizontalSpace,
                                                  Expanded(
                                                    child: MainConfirmButton(
                                                      isLoading:
                                                          sellerState.isLoading,
                                                      title: AppHelpers
                                                          .getTranslation(
                                                              TrKeys.save),
                                                      onTap: () {
                                                        if (_formKey
                                                                .currentState
                                                                ?.validate() ??
                                                            false) {
                                                          notifier.createShop(
                                                            context,
                                                            _cameraPosition
                                                                ?.target,
                                                            fetchProfileDetails:
                                                                () => ref
                                                                    .read(profileInBecomeSellerProvider
                                                                        .notifier)
                                                                    .fetchProfileDetails(
                                                                      checkYourNetwork:
                                                                          () =>
                                                                              AppHelpers.showCheckFlash(
                                                                        context,
                                                                        AppHelpers.getTranslation(
                                                                            TrKeys.checkYourNetworkConnection),
                                                                      ),
                                                                    ),
                                                            logoIsRequired:
                                                                () => AppHelpers
                                                                    .showCheckFlash(
                                                              context,
                                                              AppHelpers
                                                                  .getTranslation(
                                                                      TrKeys
                                                                          .logoImageIsRequired),
                                                            ),
                                                            backgroundIsRequired:
                                                                () => AppHelpers
                                                                    .showCheckFlash(
                                                              context,
                                                              AppHelpers
                                                                  .getTranslation(
                                                                      TrKeys
                                                                          .backgroundImageIsRequired),
                                                            ),
                                                            openTimeIsRequired:
                                                                () => AppHelpers
                                                                    .showCheckFlash(
                                                              context,
                                                              AppHelpers
                                                                  .getTranslation(
                                                                      TrKeys
                                                                          .openTimeIsRequired),
                                                            ),
                                                            closeTimeIsRequired:
                                                                () => AppHelpers
                                                                    .showCheckFlash(
                                                              context,
                                                              AppHelpers
                                                                  .getTranslation(
                                                                      TrKeys
                                                                          .closeTimeIsRequired),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              20.verticalSpace,
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  );
              },
            ),
          ),
        ),
      ),
    );
  }
}
