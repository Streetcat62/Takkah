import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/presentation/component/list_items/food_brands_item.dart';

import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';
import '../../../../../component/helper/category_one_shimmer.dart';

class CreateFoodBrandsModal extends ConsumerStatefulWidget {
  const CreateFoodBrandsModal({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateFoodBrandsModal> createState() =>
      _CreateFoodUnitsModalState();
}

class _CreateFoodUnitsModalState extends ConsumerState<CreateFoodBrandsModal> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(foodCategoriesProvider.notifier)
            .setBrands(ref.watch(foodCategoriesProvider).brand);
        ref.read(foodCategoriesProvider.notifier).fetchBrands(context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(foodCategoriesProvider);
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: state.isLoading ? const CategoryOneShimmer() :Column(
          children: [
            const ModalDrag(),
            TitleAndIcon(title: AppHelpers.trans(TrKeys.brand), titleSize: 16),
            24.verticalSpace,
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(foodCategoriesProvider);
                  final event = ref.read(foodCategoriesProvider.notifier);
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: state.brand.length,
                    itemBuilder: (context, index) => FoodBrandsItem(
                      brand: state.brand[index].brand?.title ?? "",
                      onTap: () => event.setActiveBrandIndex(index),
                      isSelected: state.activeBrandIndex == index,
                      isBrand: true,
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
