import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../routes/app_router.gr.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

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
      (_) => ref.read(splashProvider.notifier).fetchTranslations(
            noConnection: () => context.replaceRoute(const NoConnectionRoute()),
            goMain: () => context.replaceRoute(const HomeRoute()),
            goLogin: () => context.replaceRoute(const LoginRoute()),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Image.asset(AppAssets.pngSplash, fit: BoxFit.cover);
  }
}
