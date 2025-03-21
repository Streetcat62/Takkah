import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/utils.dart';
import 'riverpod/provider/splash_provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(splashProvider.notifier).fetchSettings(
              goMain: () => context.replaceRoute(const MainRoute()),
              goLogin: () => context.replaceRoute(const LoginRoute()),
              goToSelectLang: () =>
                  context.replaceRoute(SelectLangRoute(isRequired: true)),
              goToOnBoarding: () =>
                  context.replaceRoute(const OnBoardingRoute()),
              goToAddAddress: () =>
                  context.replaceRoute(AddAddressRoute(isRequired: true)),
            );
        ref.read(splashProvider.notifier).getTranslations();
        if (LocalStorage.instance.getUser() != null) {
          ref.read(splashProvider.notifier).getProfileDetails();
        }
        if (LocalStorage.instance.getSelectedCurrency() == null) {
          ref.read(splashProvider.notifier).fetchCurrencies();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.pngSundaymartSplash, fit: BoxFit.cover);
  }
}
