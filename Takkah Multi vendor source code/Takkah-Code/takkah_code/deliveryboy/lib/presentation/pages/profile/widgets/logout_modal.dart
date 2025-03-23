import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../routes/app_router.gr.dart';
import '../../../../infrastructure/services/services.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          40.verticalSpace,
          Text(
            '${AppHelpers.getTranslation(TrKeys.doYouReallyWantToLogout)}?',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              color: Style.blackColor,
              fontWeight: FontWeight.w500,
              letterSpacing: -14 * 0.02,
            ),
          ),
          36.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: AppHelpers.getTranslation(TrKeys.cancel),
                  onPressed: context.popRoute,
                  background: Style.transparent,
                  borderColor: Style.blackColor,
                  textColor: Style.blackColor,
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: CustomButton(
                  title: AppHelpers.getTranslation(TrKeys.yes),
                  onPressed: () {
                    final GoogleSignIn signIn = GoogleSignIn();
                    signIn.disconnect();
                    signIn.signOut();
                    LocalStorage.instance.logout();
                    context.router.popUntilRoot();
                    context.replaceRoute(const LoginRoute());
                  },
                  background: Style.primaryColor,
                  borderColor: Style.primaryColor,
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
