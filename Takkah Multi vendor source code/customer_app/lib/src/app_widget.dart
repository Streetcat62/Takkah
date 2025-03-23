import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_manager.dart';
import 'riverpod/provider/app_provider.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => ScreenUtilInit(
        useInheritedMediaQuery: false,
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          locale: Locale(ref.watch(appProvider).activeLanguage?.locale ?? 'en'),
          themeMode: ref.watch(appProvider).isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
        ),
      );
}
