import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import 'riverpod/provider/recipes_in_shop_provider.dart';
import 'riverpod/provider/recipe_categories_provider.dart';

class ShopRecipesPage extends ConsumerStatefulWidget {
  final int? shopId;

  const ShopRecipesPage({Key? key, this.shopId}) : super(key: key);

  @override
  ConsumerState<ShopRecipesPage> createState() => _ShopRecipesPageState();
}

class _ShopRecipesPageState extends ConsumerState<ShopRecipesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(recipeCategoriesProvider.notifier)
            .fetchRecipeCategories(shopId: widget.shopId);
        ref
            .read(recipesInShopProvider.notifier)
            .fetchRecipes(shopId: widget.shopId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          31.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.recipeCategories),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: AppColors.iconAndTextColor(),
                    letterSpacing: -1,
                  ),
                ),
                GestureDetector(
                  onTap: () => context
                      .pushRoute(RecipeCategoriesRoute(shopId: widget.shopId)),
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.viewMore),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.blue,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Consumer(
            builder: (context, ref, child) {
              final recipesState = ref.watch(recipeCategoriesProvider);
              return RecipeCategoriesBody(
                isLoading: recipesState.isLoading,
                recipeCategories: recipesState.recipeCategories,
                shopId: widget.shopId,
              );
            },
          ),
          40.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.recipes),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: AppColors.iconAndTextColor(),
                    letterSpacing: -1,
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      context.pushRoute(RecipesRoute(shopId: widget.shopId)),
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.viewMore),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.blue,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Consumer(
              builder: (context, ref, child) {
                final recipesState = ref.watch(recipesInShopProvider);
                return GridRecipesBody(
                  isLoading: recipesState.isLoading,
                  recipes: recipesState.recipes,
                  shopId: widget.shopId,
                  bottomPadding: 24,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
