import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../theme/app_colors.dart';
import 'riverpod/provider/more_recipe_category_provider.dart';

class MoreRecipeCategoryPage extends ConsumerStatefulWidget {
  final RecipeCategoryChild? categoryChild;
  final int? shopId;

  const MoreRecipeCategoryPage({Key? key, this.categoryChild, this.shopId})
      : super(key: key);

  @override
  ConsumerState<MoreRecipeCategoryPage> createState() =>
      _MoreRecipeCategoryPageState();
}

class _MoreRecipeCategoryPageState
    extends ConsumerState<MoreRecipeCategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(moreRecipeCategoryProvider.notifier)
            .fetchRecipeCategoryDetails(
              categoryId: widget.categoryChild?.id,
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
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: CommonAppBar(
        title: '${widget.categoryChild?.translation?.title}',
        onLeadingPressed: context.popRoute,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(moreRecipeCategoryProvider);
            return GridRecipesBody(
              isLoading: state.isLoading || state.categoryData == null,
              recipes: state.categoryData?.recipes ?? [],
              shopId: widget.shopId,
            );
          },
        ),
      ),
    );
  }
}
