import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../component/components.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

class OrderHistoryPage extends ConsumerStatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends ConsumerState<OrderHistoryPage> {
  late RefreshController _historyController;

  @override
  void initState() {
    super.initState();
    _historyController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(orderProvider.notifier).fetchHistoryOrders(context),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _historyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderProvider);
    return Scaffold(
      backgroundColor: Style.greyColor,
      body: Column(
        children: [
          CustomAppBar(
            bottomPadding: 16.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.orderHistory),
                  style: Style.interSemi(size: 18.sp),
                ),
                Text(
                  '${AppHelpers.getTranslation(TrKeys.thereAre)} ${state.historyOrders.length} ${AppHelpers.getTranslation(TrKeys.orders)}',
                  style: Style.interRegular(size: 12.sp, letterSpacing: -0.3),
                ),
              ],
            ),
          ),
          state.isHistoryLoading
              ? const Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Loading(),
                )
              : Expanded(
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    onRefresh: () =>
                        ref.read(orderProvider.notifier).fetchHistoryOrdersPage(
                              context,
                              _historyController,
                              isRefresh: true,
                            ),
                    onLoading: () =>
                        ref.read(orderProvider.notifier).fetchHistoryOrdersPage(
                              context,
                              _historyController,
                            ),
                    controller: _historyController,
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                        top: 30.h,
                        bottom: MediaQuery.of(context).padding.bottom + 42.h,
                        left: 16.r,
                        right: 16.r,
                      ),
                      shrinkWrap: true,
                      itemCount: state.historyOrders.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => OrdersItem(
                        isOrder: false,
                        order: state.historyOrders[index],
                      ),
                    ),
                  ),
                ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PopButton(),
            ButtonsBouncingEffect(
              child: GestureDetector(
                onTap: () => AppHelpers.showCustomModalBottomSheet(
                  paddingTop: MediaQuery.of(context).padding.top,
                  context: context,
                  radius: 12,
                  modal: const FilterModal(),
                  isDarkMode: true,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Style.primaryColor,
                  ),
                  padding: EdgeInsets.all(16.r),
                  child: Icon(
                    FlutterRemix.equalizer_fill,
                    color: Style.white,
                    size: 24.r,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
