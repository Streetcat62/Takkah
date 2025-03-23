import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_details_modal.dart';
import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';
import '../riverpod/provider/on_a_way_orders_provider.dart';

class OnAWayOrdersBody extends ConsumerStatefulWidget {
  const OnAWayOrdersBody({Key? key}) : super(key: key);

  @override
  ConsumerState<OnAWayOrdersBody> createState() => _OnAWayOrdersBodyState();
}

class _OnAWayOrdersBodyState extends ConsumerState<OnAWayOrdersBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(onAWayOrdersProvider.notifier).fetchOnAWayOrders(
          checkYourNetwork: () {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onAWayOrdersProvider);
    return state.isLoading
        ? Center(
            child: CircularProgressIndicator(
              strokeWidth: 3.r,
              color: AppColors.green,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: state.onAWayOrders.length,
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 30),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return OrderHistoryItem(
                order: state.onAWayOrders[index],
                onTap: () {
                  AppHelpers.showCustomModalBottomSheet(
                    context: context,
                    background: AppColors.transparent,
                    paddingTop: 90,
                    modal: OrderDetailsModal(
                      orderId: state.onAWayOrders[index].id,
                      activeTabIndex: 3,
                    ),
                  );
                },
              );
            },
          );
  }
}
