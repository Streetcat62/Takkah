import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/settings_item.dart';
import '../../../../theme/theme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../riverpod/provider/app_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appProvider);
    final notifier = ref.read(appProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.settings),
        onLeadingPressed: context.popRoute,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            16.verticalSpace,
            SettingsItem(
              icon: FlutterRemix.creative_commons_nd_line,
              title: AppHelpers.getTranslation(TrKeys.uiTheme),
              rightWidget: CupertinoSwitch(
                activeColor: AppColors.black,
                value: state.isDarkMode,
                onChanged: (value) => notifier.changeTheme(!state.isDarkMode),
              ),
            ),
            SettingsItem(
              icon: FlutterRemix.global_line,
              title: AppHelpers.getTranslation(TrKeys.language),
              onTap: () =>
                  context.pushRoute(SelectLangRoute(isRequired: false)),
              rightWidget: Row(
                children: [
                  Text(
                    '${state.activeLanguage?.title}',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  6.horizontalSpace,
                  Icon(
                    FlutterRemix.arrow_down_s_line,
                    size: 18.r,
                    color: AppColors.iconAndTextColor(),
                  ),
                ],
              ),
            ),
            SettingsItem(
              icon: FlutterRemix.coin_line,
              title: AppHelpers.getTranslation(TrKeys.currencies),
              onTap: () => context.pushRoute(const CurrenciesRoute()),
              rightWidget: Icon(
                FlutterRemix.arrow_right_s_line,
                size: 18.r,
                color: AppColors.iconAndTextColor(),
              ),
            ),
            SettingsItem(
              icon: FlutterRemix.map_pin_add_line,
              title: AppHelpers.getTranslation(TrKeys.savedLocations),
              onTap: () => context.pushRoute(const SavedLocationsRoute()),
              rightWidget: Icon(
                FlutterRemix.arrow_right_s_line,
                size: 18.r,
                color: AppColors.iconAndTextColor(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
