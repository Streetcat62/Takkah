import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';
import '../../../../../component/helper/category_one_shimmer.dart';

class CreateFoodUnitsModal extends ConsumerStatefulWidget {
  const CreateFoodUnitsModal({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateFoodUnitsModal> createState() =>
      _CreateFoodUnitsModalState();
}

class _CreateFoodUnitsModalState extends ConsumerState<CreateFoodUnitsModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(createFoodUnitsProvider.notifier).fetchUnits(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createFoodUnitsProvider);
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: state.isLoading
            ? const CategoryOneShimmer()
            : Column(
                children: [
                  const ModalDrag(),
                  TitleAndIcon(
                      title: AppHelpers.trans(TrKeys.units), titleSize: 16),
                  24.verticalSpace,
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(createFoodUnitsProvider);
                        final event =
                            ref.read(createFoodUnitsProvider.notifier);
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: state.units.length,
                          itemBuilder: (context, index) => FoodUnitItem(
                            unit: state.units[index],
                            onTap: () => event.setActiveIndex(index),
                            isSelected: state.activeIndex == index,
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
