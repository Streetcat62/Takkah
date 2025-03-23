import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/models.dart';
import '../shimmers/grid_list_shimmer.dart';
import '../list_items/grid_recipe_item.dart';

class GridRecipesBody extends StatelessWidget {
  final bool isLoading;
  final List<RecipeData> recipes;
  final int? shopId;
  final double? bottomPadding;

  const GridRecipesBody({
    Key? key,
    this.isLoading = false,
    this.recipes = const [],
    this.shopId,
    this.bottomPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const GridListShimmer(
            isScrollable: true,
            onlyBottomPadding: 100,
            verticalPadding: 24,
          )
        : GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: recipes.length,
            padding: REdgeInsets.only(top: 24, bottom: bottomPadding ?? 100),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 188 / 328,
              mainAxisSpacing: 18.r,
              crossAxisSpacing: 8.r,
              crossAxisCount: 2,
            ),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GridRecipeItem(recipe: recipes[index], shopId: shopId);
            },
          );
  }
}
