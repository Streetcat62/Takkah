import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../application/providers.dart';
import '../domain/di/dependency_manager.dart';
import '../infrastructure/services/services.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => FutureBuilder(
        future: Future.wait([setUpDependencies(), LocalStorage.getInstance()]),
        builder: (context, AsyncSnapshot<List<dynamic>> snap) => ScreenUtilInit(
          useInheritedMediaQuery: false,
          designSize: const Size(375, 812),
          builder: (context, child) => RefreshConfiguration(
            footerBuilder: () => const ClassicFooter(
              idleIcon: SizedBox.shrink(),
              idleText: '',
              noDataText: '',
              noMoreIcon: SizedBox.shrink(),
            ),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
              locale: Locale(
                ref.watch(appProvider).activeLanguage?.locale ?? 'en',
              ),
              themeMode: ThemeMode.light,
            ),
          ),
        ),
      );
}
