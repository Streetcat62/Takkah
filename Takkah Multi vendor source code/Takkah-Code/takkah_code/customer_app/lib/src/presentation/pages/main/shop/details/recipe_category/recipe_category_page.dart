import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../theme/app_colors.dart';
import 'riverpod/provider/recipe_category_provider.dart';

class RecipeCategoryPage extends ConsumerStatefulWidget {
  final RecipeCategoryData categoryData;
  final int? shopId;

  const RecipeCategoryPage({Key? key, required this.categoryData, this.shopId})
      : super(key: key);

  @override
  ConsumerState<RecipeCategoryPage> createState() => _RecipeCategoryPageState();
}

class _RecipeCategoryPageState extends ConsumerState<RecipeCategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(recipeCategoryProvider.notifier).fetchRecipeCategoryDetails(
              categoryId: widget.categoryData.id,
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
        title: '${widget.categoryData.translation?.title}',
        onLeadingPressed: context.popRoute,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(recipeCategoryProvider);
          return state.isLoading || state.categoryData == null
              ? const ShopCategoriesShimmer()
              : ListView.builder(
                  itemCount: state.categoryData?.child?.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (state.categoryData?.child?[index] == null ||
                        state.categoryData?.child?[index].recipes == null ||
                        (state.categoryData?.child?[index].recipes?.isEmpty ??
                            false)) {
                      return const SizedBox.shrink();
                    }
                    return RecipeCategoryItem(
                      categoryChild: state.categoryData?.child?[index],
                      shopId: widget.shopId,
                    );
                  },
                );
        },
      ),
    );
  }
}
