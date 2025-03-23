import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({Key? key}) : super(key: key);

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
            '${AppHelpers.getTranslation(TrKeys.doYouReallyWantToLogout)}?',
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              color: AppColors.black,
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
                child: MainConfirmButton(
                  title: AppHelpers.getTranslation(TrKeys.yes),
                  onTap: () {
                    final GoogleSignIn signIn = GoogleSignIn();
                    signIn.disconnect();
                    signIn.signOut();
                    LocalStorage.instance.logout();
                    context.router.popUntilRoot();
                    context.replaceRoute(const LoginRoute());
                  },
                  background: AppColors.red,
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
