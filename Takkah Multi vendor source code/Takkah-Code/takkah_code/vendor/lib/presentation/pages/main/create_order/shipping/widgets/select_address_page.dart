import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/presentation/routes/app_router.gr.dart';
import '../../../../../styles/style.dart';
import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';
import 'address_items.dart';

class SelectAddressFromListPage extends ConsumerStatefulWidget {
  const SelectAddressFromListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SelectAddressFromListPage> createState() =>
      _SelectUserPageState();
}

class _SelectUserPageState extends ConsumerState<SelectAddressFromListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(orderAddressProvider.notifier).initialFetchSingleUser(
          uuId: ref.watch(orderUserProvider).selectedUser?.uuid ?? '',
          id: ref.watch(orderUserProvider).selectedUser?.id ?? 0),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        backgroundColor: Style.greyColor,
        body: Consumer(
          builder: (context, ref, child) {
            final addressState = ref.watch(orderAddressProvider);
            final addressEvent = ref.read(orderAddressProvider.notifier);
            return Column(
              children: [
                addressState.isAddressLoading
                    ? const Expanded(
                        child: LoadingList(
                          horizontalPadding: 16,
                          itemCount: 10,
                          verticalPadding: 8,
                          itemHeight: 74,
                          itemBorderRadius: 10,
                        ),
                      )
                    : Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 36),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount:
                                  addressState.user?.addresses?.length ?? 0,
                              shrinkWrap: true,
                              padding: REdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 20,
                                bottom: 80,
                              ),
                              itemBuilder: (context, index) => AddressItem(
                                index,
                                isSelected:
                                    index == addressState.selectedAddressIndex,
                                onTap: () async {
                                  addressEvent.setSelectedAddress(
                                    index,
                                  );

                                  context
                                      .pushRoute(const ShippingAddressRoute());
                                },
                              ),
                            )),
                      )
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: REdgeInsets.all(16),
          child: const PopButton(heroTag: AppConstants.heroTagAddOrderButton),
        ),
      ),
    );
  }
}
