import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'foods/foods_page.dart';
import '../../styles/style.dart';
import 'orders/orders_home_page.dart';
import '../../component/components.dart';
import '../../routes/app_router.gr.dart';
import 'widgets/bottom_navigator_item.dart';
import '../shop/shop_page.dart';
import '../../../application/providers.dart';
import 'foods/create/create_product_modal.dart';
import '../../../infrastructure/services/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<IndexedStackChild> list = [
    IndexedStackChild(child: const OrdersHomePage(), preload: true),
    IndexedStackChild(child: const FoodsPage(), preload: false),
    IndexedStackChild(child: const ShopPage(), preload: false),
  ];

  @override
  void initState() {
    FirebaseMessaging.instance.requestPermission(
      sound: true,
      alert: true,
      badge: false,
    );
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      await Firebase.initializeApp();
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AppHelpers.showCheckTopSnackBar(
        context,
        type: SnackBarType.success,
        text:
            "${AppHelpers.trans(TrKeys.id)} #${message.notification?.title} ${message.notification?.body}",
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDisable(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Consumer(
            builder: (
              BuildContext context,
              WidgetRef ref,
              Widget? child,
            ) =>
                ProsteIndexedStack(
              index: ref.watch(mainProvider).selectedIndex,
              children: list,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(mainProvider);
              final event = ref.read(mainProvider.notifier);
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlurWrap(
                    radius: BorderRadius.circular(100.r),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: Style.bottomNavigationBarColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      height: 60.r,
                      child: Padding(
                        padding: REdgeInsets.only(
                          right: 10,
                          left: !state.isScrolling ? 10 : 0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BottomNavigatorItem(
                              isScrolling: state.isScrolling,
                              selectItem: () => event.selectIndex(0),
                              currentIndex: state.selectedIndex,
                              index: 0,
                              selectIcon: FlutterRemix.file_list_2_fill,
                              unSelectIcon: FlutterRemix.file_list_2_line,
                            ),
                            BottomNavigatorItem(
                              isScrolling: state.isScrolling,
                              selectItem: () => event.selectIndex(1),
                              index: 1,
                              currentIndex: state.selectedIndex,
                              selectIcon: FlutterRemix.restaurant_fill,
                              unSelectIcon: FlutterRemix.restaurant_line,
                            ),
                            _profileItem(
                              () {
                                event.selectIndex(2);
                                event.changeScrolling(false);
                              },
                              state.selectedIndex,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  state.selectedIndex != 2
                      ? ButtonsBouncingEffect(
                          child: Hero(
                            tag: AppConstants.heroTagAddOrderButton,
                            child: Consumer(
                              builder: (context, ref, child) {
                                final foodTabState =
                                    ref.watch(foodTabsProvider);
                                return GestureDetector(
                                  onTap: () {
                                    state.selectedIndex == 0
                                        ? context
                                            .pushRoute(const CreateOrderRoute())
                                        : (foodTabState.selectedIndex == 0
                                            ? AppHelpers
                                                .showCustomModalBottomSheet(
                                                paddingTop:
                                                    MediaQuery.of(context)
                                                            .padding
                                                            .top +
                                                        64.h,
                                                context: context,
                                                modal:
                                                    const CreateProductModal(),
                                                isDarkMode: false,
                                              )
                                            : const SizedBox.shrink());
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsetsDirectional.only(start: 8.r),
                                    width: 56.r,
                                    height: 56.r,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Style.primaryColor,
                                    ),
                                    child: Icon(
                                      FlutterRemix.add_line,
                                      size: 26.r,
                                      color: Style.blackColor,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  GestureDetector _profileItem(Function() onTap, int index) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.r,
        height: 40.r,
        margin: EdgeInsets.only(left: 12.r),
        decoration: BoxDecoration(
          border: Border.all(
            color: index == 2 ? Style.primaryColor : Style.transparent,
            width: 2.w,
          ),
          shape: BoxShape.circle,
        ),
        child: CommonImage(
          imageUrl: LocalStorage.instance.getShop()?.logoImg,
          width: 40,
          height: 40,
          radius: 20,
        ),
      ),
    );
  }
}
