import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../styles/style.dart';
import '../../component/components.dart';
import '../../../application/providers.dart';

class StoryPage extends ConsumerStatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends ConsumerState<StoryPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  final List<String> image = [
    "https://www.deliveryhero.com/wp-content/uploads/2021/01/TAR_5922.jpg",
    'https://images.ctfassets.net/trvmqu12jq2l/1LFP1rAaPMiEx5y11ZZv2F/5167948e81a58a08e516631e07ee154c/blog-hero-1208x1080-v115.14.01.jpg',
    'https://images.unsplash.com/photo-1566576721346-d4a3b4eaeb55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFja2FnZSUyMGRlbGl2ZXJ5fGVufDB8fDB8fA%3D%3D&w=1000&q=80',
  ];
  final List<String> titles = [
    "Be polite when delivering the order to the customer",
    "Be careful with what you are carrying",
    "Be polite when delivering the order to the customer",
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(
        () {
          setState(() {});
          if (controller.value > 0.99) {
            if (ref.watch(storyProvider).currentIndex == 2) {
              context.popRoute();
            }
            pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          }
        },
      );
    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(storyProvider);
    final event = ref.read(storyProvider.notifier);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            controller: pageController,
            onPageChanged: (s) {
              event.changeIndex(s);
              controller.reset();
              controller.repeat();
            },
            children: [
              ...image.map(
                (e) => Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Style.primaryColor.withOpacity(0.26),
                            Style.primaryColor.withOpacity(0),
                            Style.primaryColor.withOpacity(0),
                            Style.primaryColor.withOpacity(0.26)
                          ],
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Style.blackColor.withOpacity(0.4),
                              Style.blackColor.withOpacity(0.4)
                            ],
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: e,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) {
                            return const ImageShimmer(
                              isCircle: false,
                              size: 0,
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Style.greyColor,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                FlutterRemix.image_line,
                                color: Style.blackColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Column(
                          children: [
                            const Spacer(),
                            Text(
                              titles[image.indexOf(e)],
                              style: Style.interNormal(
                                  size: 32.sp, color: Style.white),
                            ),
                            24.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Style.transparent,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width / 2,
                            color: Style.transparent,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 16.w,
                      top: 48.h,
                      child: GestureDetector(
                        onTap: context.popRoute,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            FlutterRemix.close_fill,
                            color: Style.white,
                            size: 30.r,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Container(
                height: 4.h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      margin: EdgeInsets.only(right: 8.w),
                      height: 4.h,
                      width: (MediaQuery.of(context).size.width - 60.w) / 3,
                      decoration: BoxDecoration(
                        color: state.currentIndex >= index
                            ? Style.primaryColor
                            : Style.white,
                        borderRadius: BorderRadius.circular(122.r),
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: state.currentIndex == index
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(122.r),
                              child: LinearProgressIndicator(
                                value: controller.value,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Style.primaryColor,
                                ),
                                backgroundColor: Style.white,
                              ),
                            )
                          : state.currentIndex > index
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(122.r),
                                  child: const LinearProgressIndicator(
                                    value: 1,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Style.primaryColor,
                                    ),
                                    backgroundColor: Style.white,
                                  ),
                                )
                              : const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
