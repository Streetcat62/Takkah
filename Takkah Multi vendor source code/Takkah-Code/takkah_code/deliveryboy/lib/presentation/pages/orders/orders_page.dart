import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import 'widgets/orders_body.dart';
import '../../component/components.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

class OrdersPage extends ConsumerStatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late RefreshController _activeController;
  late RefreshController _availableController;

  final _tabs = [
    Tab(
      child: Text(
        AppHelpers.getTranslation(TrKeys.activeOrders),
      ),
    ),
    Tab(
      child: Text(
        AppHelpers.getTranslation(TrKeys.availableOrders),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _activeController = RefreshController();
    _availableController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(orderProvider.notifier)
          ..initialFetchActiveOrders(context)
          ..fetchAvailableOrders(context);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _activeController.dispose();
    _availableController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderProvider);
    final event = ref.read(orderProvider.notifier);
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
                  AppHelpers.getTranslation(TrKeys.orders),
                  style: Style.interSemi(size: 18.sp),
                ),
                Row(
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.thereAre),
                      style:
                          Style.interRegular(size: 12.sp, letterSpacing: -0.3),
                    ),
                    Text(
                      ' ${state.totalActiveOrder} ',
                      style:
                          Style.interRegular(size: 12.sp, letterSpacing: -0.3),
                    ),
                    Text(
                      AppHelpers.getTranslation(TrKeys.orders).toLowerCase(),
                      style:
                          Style.interRegular(size: 12.sp, letterSpacing: -0.3),
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child:
                      CustomTabBar(tabController: _tabController, tabs: _tabs),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      OrdersBody(
                        isLoading: state.isActiveLoading,
                        orders: state.activeOrders,
                        refreshController: _activeController,
                        onRefresh: () => event.refreshActiveOrders(
                          context,
                          controller: _activeController,
                          emptyActiveOrders: () => ref
                              .read(homeProvider.notifier)
                              .setCurrentActiveOrder(context),
                        ),
                        onLoading: () => event.fetchMoreActiveOrdersPage(
                          context,
                          _activeController,
                        ),
                      ),
                      OrdersBody(
                        isLoading: state.isAvailableLoading,
                        orders: state.availableOrders,
                        refreshController: _availableController,
                        onRefresh: () => event.fetchAvailableOrdersPage(
                          context,
                          _availableController,
                          isRefresh: true,
                        ),
                        onLoading: () => event.fetchAvailableOrdersPage(
                          context,
                          _availableController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const PopButton(),
    );
  }
}
