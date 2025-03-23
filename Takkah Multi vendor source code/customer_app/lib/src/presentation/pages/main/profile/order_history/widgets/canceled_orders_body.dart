import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_details_modal.dart';
import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';
import '../riverpod/provider/canceled_orders_provider.dart';

class CanceledOrdersBody extends ConsumerStatefulWidget {
  const CanceledOrdersBody({Key? key}) : super(key: key);

  @override
  ConsumerState<CanceledOrdersBody> createState() => _CanceledOrdersBodyState();
}

class _CanceledOrdersBodyState extends ConsumerState<CanceledOrdersBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(canceledOrdersProvider.notifier).fetchCanceledOrders(
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
    final state = ref.watch(canceledOrdersProvider);
    return state.isLoading
        ? Center(
            child: CircularProgressIndicator(
              strokeWidth: 3.r,
              color: AppColors.green,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: state.canceledOrders.length,
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 30),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return OrderHistoryItem(
                order: state.canceledOrders[index],
                onTap: () {
                  AppHelpers.showCustomModalBottomSheet(
                    context: context,
                    background: AppColors.transparent,
                    paddingTop: 90,
                    modal: OrderDetailsModal(
                      orderId: state.canceledOrders[index].id,
                      activeTabIndex: 5,
                    ),
                  );
                },
              );
            },
          );
  }
}
