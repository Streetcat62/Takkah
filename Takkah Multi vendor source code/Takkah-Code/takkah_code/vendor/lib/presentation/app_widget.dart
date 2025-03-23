import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'styles/style.dart';
import '../domain/di/dependency_manager.dart';
import '../infrastructure/services/services.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: Future.wait(
        [
          Firebase.initializeApp(),
          setUpDependencies(),
          LocalStorage.getInstance(),
        ],
      ),
      builder: (context, AsyncSnapshot<List<dynamic>> snap) => ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => RefreshConfiguration(
          footerBuilder: () => const ClassicFooter(
            idleIcon: SizedBox.shrink(),
            idleText: '',
            noDataText: '',
            noMoreIcon: null,
            loadingText: '',
            loadingIcon: CupertinoActivityIndicator(),
            loadStyle: LoadStyle.ShowWhenLoading,
          ),
          headerBuilder: () => const WaterDropMaterialHeader(
            backgroundColor: Style.white,
            distance: 30,
            color: Style.blackColor,
          ),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            locale: Locale(LocalStorage.instance.getLanguage()?.locale ?? 'en'),
            themeMode: ThemeMode.light,
            builder: (context, child) =>
                ScrollConfiguration(behavior: CustomBehavior(), child: child!),
          ),
        ),
      ),
    );
  }
}
