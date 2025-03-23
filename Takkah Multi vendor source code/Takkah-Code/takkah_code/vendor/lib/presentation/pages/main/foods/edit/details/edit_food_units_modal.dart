import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../styles/style.dart';
import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class EditFoodUnitsModal extends ConsumerStatefulWidget {
  const EditFoodUnitsModal({Key? key}) : super(key: key);

  @override
  ConsumerState<EditFoodUnitsModal> createState() => _EditFoodUnitsModalState();
}

class _EditFoodUnitsModalState extends ConsumerState<EditFoodUnitsModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(editFoodUnitsProvider.notifier).fetchUnits(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ModalDrag(),
              TitleAndIcon(
                title: AppHelpers.trans(TrKeys.units),
                titleSize: 16,
              ),
              24.verticalSpace,
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(editFoodUnitsProvider);
                  final event = ref.read(editFoodUnitsProvider.notifier);
                  return state.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3.r,
                            color: Style.primaryColor,
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: state.units.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => FoodUnitItem(
                            unit: state.units[index],
                            onTap: () => event.setActiveIndex(index),
                            isSelected: state.activeIndex == index,
                          ),
                        );
                },
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
      ),
    );
  }
}
