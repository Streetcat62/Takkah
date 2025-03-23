import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_details_modal.dart';
import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../riverpod/provider/new_orders_provider.dart';

class NewOrdersBody extends ConsumerStatefulWidget {
  const NewOrdersBody({Key? key}) : super(key: key);

  @override
  ConsumerState<NewOrdersBody> createState() => _NewOrdersBodyState();
}

class _NewOrdersBodyState extends ConsumerState<NewOrdersBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(newOrdersProvider.notifier).updateNewOrders();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newOrdersProvider);
    return state.isLoading
        ? Center(
            child: CircularProgressIndicator(
              strokeWidth: 3.r,
              color: AppColors.green,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: state.newOrders.length,
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 30),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return OrderHistoryItem(
                order: state.newOrders[index],
                onTap: () {
                  AppHelpers.showCustomModalBottomSheet(
                    context: context,
                    background: AppColors.transparent,
                    paddingTop: 90,
                    modal: OrderDetailsModal(
                      orderId: state.newOrders[index].id,
                      activeTabIndex: 0,
                    ),
                  );
                },
              );
            },
          );
  }
}
