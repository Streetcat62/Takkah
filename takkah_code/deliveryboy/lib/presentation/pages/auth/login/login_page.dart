import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/login_modal.dart';
import '../../../styles/style.dart';
import 'widgets/languages_modal.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/services/services.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(languagesProvider.notifier).checkLanguage(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.instance.getLangLtr();
    ref.listen(
      languagesProvider,
      (previous, next) {
        if (next.isSelectLanguage &&
            next.isSelectLanguage != previous?.isSelectLanguage) {
          AppHelpers.showCustomModalBottomSheet(
            isDismissible: false,
            isDrag: false,
            context: context,
            modal: const LanguagesModal(),
            isDarkMode: false,
          );
        }
      },
    );
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.pngSplash),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  20.verticalSpace,
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.pngSundaymartLogo,
                        width: 60.w,
                        height: 60.h,
                      ),
                      8.horizontalSpace,
                      Text(
                        AppHelpers.getAppName(),
                        style: Style.interBold(color: Style.white, size: 24),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Consumer(
                    builder: (context, ref, child) {
                      ref.watch(languagesProvider);
                      return CustomButton(
                        title: AppHelpers.getTranslation(TrKeys.login),
                        onPressed: () =>
                            AppHelpers.showCustomModalBottomSheetWithoutIosIcon(
                          context: context,
                          paddingTop: 100,
                          modal: const LoginModal(),
                          isDarkMode: false,
                        ),
                      );
                    },
                  ),
                  30.verticalSpace
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
