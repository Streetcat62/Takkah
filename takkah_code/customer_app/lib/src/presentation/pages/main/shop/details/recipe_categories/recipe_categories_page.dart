import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';
import 'riverpod/provider/all_recipe_categories_provider.dart';

class RecipeCategoriesPage extends ConsumerStatefulWidget {
  final int? shopId;

  const RecipeCategoriesPage({Key? key, this.shopId}) : super(key: key);

  @override
  ConsumerState<RecipeCategoriesPage> createState() =>
      _RecipeCategoriesPageState();
}

class _RecipeCategoriesPageState extends ConsumerState<RecipeCategoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(allRecipeCategoriesProvider.notifier).fetchRecipeCategories(
              shopId: widget.shopId,
              checkYourNetwork: () => AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.allRecipes),
        onLeadingPressed: context.popRoute,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(allRecipeCategoriesProvider);
            return state.isLoading
                ? const MainListShimmer(
                    itemHeight: 80,
                    spacing: 8,
                    borderRadius: 10,
                    verticalPadding: 30,
                    itemCount: 14,
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    padding: REdgeInsets.symmetric(vertical: 30),
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.recipeCategories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: REdgeInsets.only(bottom: 8),
                        child: HorizontalRecipeCategoryItem(
                          recipeCategoryData: state.recipeCategories[index],
                          shopId: widget.shopId,
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
