import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../riverpod/provider/delete_user_provider.dart';

class DeleteUserModal extends StatelessWidget {
  const DeleteUserModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          11.verticalSpace,
          Container(
            width: 49.r,
            height: 4.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(62.r),
              color: AppColors.secondaryIconTextColor(),
            ),
          ),
          40.verticalSpace,
          Text(
            '${AppHelpers.getTranslation(TrKeys.doYouReallyWantToDeleteAccount)}?',
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              color: AppColors.iconAndTextColor(),
              fontWeight: FontWeight.w500,
              letterSpacing: -14 * 0.02,
            ),
          ),
          36.verticalSpace,
          Row(
            children: [
              Expanded(
                child: MainConfirmButton(
                  title: AppHelpers.getTranslation(TrKeys.cancel),
                  onTap: context.popRoute,
                  background: AppColors.black,
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(deleteUserProvider);
                    final notifier = ref.read(deleteUserProvider.notifier);
                    return MainConfirmButton(
                      title: AppHelpers.getTranslation(TrKeys.yes),
                      isLoading: state.isLoading,
                      onTap: () => notifier.deleteUser(
                        checkYourNetwork: () {
                          AppHelpers.showCheckFlash(
                            context,
                            AppHelpers.getTranslation(
                                TrKeys.checkYourNetworkConnection),
                          );
                        },
                        deleted: () {
                          context.router.popUntilRoot();
                          context.replaceRoute(const LoginRoute());
                        },
                      ),
                      background: AppColors.red,
                    );
                  },
                ),
              ),
            ],
          ),
          40.verticalSpace,
        ],
      ),
    );
  }
}
