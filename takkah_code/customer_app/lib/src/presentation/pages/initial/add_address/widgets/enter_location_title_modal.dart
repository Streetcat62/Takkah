import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../riverpod/provider/add_address_provider.dart';
import '../../../main/saved_locations/riverpod/provider/saved_locations_provider.dart';

class EnterLocationTitleModal extends ConsumerWidget {
  final bool? hasBack;

  const EnterLocationTitleModal({Key? key, this.hasBack = true})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(addAddressProvider.notifier);
    final state = ref.watch(addAddressProvider);
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          11.verticalSpace,
          MainInputField(
            title: AppHelpers.getTranslation(TrKeys.enterLocationTitle),
            hintText: AppHelpers.getTranslation(TrKeys.title),
            onChange: notifier.setTitle,
          ),
          30.verticalSpace,
          MainConfirmButton(
            title: AppHelpers.getTranslation(TrKeys.save),
            onTap: state.title.isNotEmpty
                ? () => notifier.saveLocalAddress(
                      hasBack,
                      onBack: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        ref
                            .read(savedLocationsProvider.notifier)
                            .fetchSavedLocations();
                      },
                      onGoMain: () {
                        context.router.popUntilRoot();
                        context.replaceRoute(const MainRoute());
                      },
                    )
                : null,
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}
