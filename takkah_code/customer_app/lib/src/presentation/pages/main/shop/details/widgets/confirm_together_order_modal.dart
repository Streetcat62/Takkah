import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user_item_for_together.dart';
import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../riverpod/provider/open_cart_provider.dart';
import '../../../../../../core/constants/constants.dart';
import '../riverpod/provider/shop_details_provider.dart';

class ConfirmTogetherOrderModal extends ConsumerStatefulWidget {
  final int? shopId;

  const ConfirmTogetherOrderModal({Key? key, this.shopId}) : super(key: key);

  @override
  ConsumerState<ConfirmTogetherOrderModal> createState() =>
      _ConfirmTogetherOrderModalState();
}

class _ConfirmTogetherOrderModalState
    extends ConsumerState<ConfirmTogetherOrderModal> {
  @override
  void deactivate() {
    ref.read(openCartProvider.notifier).cancelTimer();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(openCartProvider);
          final notifier = ref.read(openCartProvider.notifier);
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              11.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 49.r,
                  height: 4.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(62.r),
                    color: AppColors.secondaryIconTextColor(),
                  ),
                ),
              ),
              40.verticalSpace,
              Text(
                AppHelpers.getTranslation(TrKeys.togetherOrderConfirmText),
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  color: isDarkMode ? AppColors.white : AppColors.lightBlack,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -14 * 0.02,
                ),
              ),
              20.verticalSpace,
              if (state.cartData?.together ?? false)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.members),
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: AppColors.secondaryIconTextColor(),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.4,
                      ),
                    ),
                    20.verticalSpace,
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.cartData?.userCarts?.length,
                      itemBuilder: (context, index) {
                        final userCart = state.cartData?.userCarts?[index];
                        return UserItemForTogether(
                          userCartData: userCart,
                          isLast:
                              state.cartData?.userCarts?.length == index + 1,
                          onDelete: () {
                            notifier.deleteMember(
                              uuid: userCart?.uuid,
                              checkYourNetwork: () {
                                AppHelpers.showCheckFlash(
                                  context,
                                  AppHelpers.getTranslation(
                                      TrKeys.checkYourNetworkConnection),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              36.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      title: (state.cartData?.together ?? false)
                          ? AppHelpers.getTranslation(TrKeys.delete)
                          : AppHelpers.getTranslation(TrKeys.cancel),
                      onTap: () {
                        if (state.cartData?.together ?? false) {
                          notifier.deleteCart(
                            checkYourNetwork: () {
                              AppHelpers.showCheckFlash(
                                context,
                                AppHelpers.getTranslation(
                                    TrKeys.checkYourNetworkConnection),
                              );
                            },
                          );
                        } else {
                          context.popRoute();
                        }
                      },
                      isLoading: state.isDeleting,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: MainConfirmButton(
                      title: (state.cartData?.together ?? false)
                          ? AppHelpers.getTranslation(TrKeys.copyLink)
                          : AppHelpers.getTranslation(TrKeys.start),
                      isLoading: state.isLoading,
                      onTap: () {
                        if (state.cartData?.together ?? false) {
                          /// https://sundaymart.net/together/501?cart_id=992
                          Share.share(
                            '${AppConstants.webUrl}/together/${state.cartData?.shopId}?cart_id=${state.cartData?.id}',
                            subject:
                                '${ref.watch(shopDetailsProvider).shopData?.translation?.title}',
                          );
                        } else {
                          notifier.openCart(
                            shopId: widget.shopId,
                            checkYourNetwork: () {
                              AppHelpers.showCheckFlash(
                                context,
                                AppHelpers.getTranslation(
                                    TrKeys.checkYourNetworkConnection),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
            ],
          );
        },
      ),
    );
  }
}
