import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/presentation/component/list_items/food_brands_item.dart';

import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class EditFoodBrandsModal extends ConsumerStatefulWidget {
  const EditFoodBrandsModal({Key? key}) : super(key: key);

  @override
  ConsumerState<EditFoodBrandsModal> createState() =>
      _CreateFoodUnitsModalState();
}

class _CreateFoodUnitsModalState extends ConsumerState<EditFoodBrandsModal> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .watch(editFoodDetailsProvider.notifier)
            .setBrands(ref.watch(editFoodDetailsProvider).brands);
        ref.read(editFoodDetailsProvider.notifier).fetchBrands(context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ModalDrag(),
            TitleAndIcon(title: AppHelpers.trans(TrKeys.brand), titleSize: 16),
            24.verticalSpace,
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(editFoodDetailsProvider);
                  final event = ref.read(editFoodDetailsProvider.notifier);
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: state.brands.length,
                    itemBuilder: (context, index) => FoodBrandsItem(
                      brand: state.brands[index].brand?.title,
                      isBrand: true,
                      onTap: () {
                        event.setActiveBrandIndex(index);
                      },
                      isSelected: state.activeBrandIndex == index,
                    ),
                  );
                },
              ),
            ),
            24.verticalSpace,
            CustomButton(
              title: AppHelpers.trans(TrKeys.close),
              onPressed: context.popRoute,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
