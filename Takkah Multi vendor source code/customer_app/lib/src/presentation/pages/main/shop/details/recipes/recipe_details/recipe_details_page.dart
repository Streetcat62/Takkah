import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/nutrition_item.dart';
import 'widgets/ingredient_item.dart';
import 'widgets/instruction_item.dart';
import 'widgets/recipe_info_item.dart';
import 'widgets/recipe_info_divider.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import 'riverpod/provider/recipe_details_provider.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import 'riverpod/provider/ingredients_to_cart_provider.dart';
import 'riverpod/provider/ingredients_visible_provider.dart';

class RecipeDetailsPage extends ConsumerStatefulWidget {
  final int? shopId;
  final RecipeData recipe;

  const RecipeDetailsPage({Key? key, required this.recipe, this.shopId})
      : super(key: key);

  @override
  ConsumerState<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends ConsumerState<RecipeDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(ingredientsVisibleProvider.notifier)
            .toggleVisibility(value: false);
        ref.read(ingredientsToCartProvider.notifier).addedProducts(false);
        ref.read(recipeDetailsProvider.notifier).fetchRecipeDetails(
              recipeId: widget.recipe.id,
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
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                expandedHeight: 288.r,
                toolbarHeight: 56.r,
                backgroundColor: AppColors.mainAppbarBack(),
                automaticallyImplyLeading: false,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  title: Container(
                    width: double.infinity,
                    height: 56.r,
                    margin: REdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      minHeight: 56.r,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mainAppbarBack(),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Text(
                      '${widget.recipe.translation?.title}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        letterSpacing: -14 * 0.02,
                        color: AppColors.iconAndTextColor(),
                      ),
                    ),
                  ),
                  background: Container(
                    color: AppColors.mainBackground(),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 28,
                          left: 0,
                          right: 0,
                          child: Hero(
                            tag:
                                '${AppConstants.tagHeroRecipeImage}${widget.recipe.id}',
                            child: CommonImage(
                              imageUrl: widget.recipe.image,
                              width: double.infinity,
                              radius: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: [
                        16.verticalSpace,
                        Container(
                          height: 72.r,
                          padding: REdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          color: AppColors.secondaryBack(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RecipeInfoItem(
                                title: AppHelpers.getTranslation(
                                    TrKeys.activeTime),
                                value: '${widget.recipe.activeTime} min',
                              ),
                              const RecipeInfoDivider(),
                              RecipeInfoItem(
                                title:
                                    AppHelpers.getTranslation(TrKeys.totalTime),
                                value: '${widget.recipe.totalTime} min',
                              ),
                              const RecipeInfoDivider(),
                              RecipeInfoItem(
                                title:
                                    AppHelpers.getTranslation(TrKeys.calories),
                                value: '${widget.recipe.calories}',
                              ),
                            ],
                          ),
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            final state = ref.watch(recipeDetailsProvider);
                            return state.isLoading
                                ? Padding(
                                    padding: REdgeInsets.only(top: 34),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.green,
                                        strokeWidth: 4.r,
                                      ),
                                    ),
                                  )
                                : Container(
                                    color: AppColors.mainAppbarBack(),
                                    width: double.infinity,
                                    padding:
                                        REdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        34.verticalSpace,
                                        Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.ingredientsList),
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: AppColors.iconAndTextColor(),
                                            letterSpacing: -0.4,
                                          ),
                                        ),
                                        16.verticalSpace,
                                        (state.recipeData?.recipeProducts !=
                                                null
                                            ? ListView.builder(
                                                itemCount: state.recipeData
                                                    ?.recipeProducts?.length,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return IngredientItem(
                                                    product: state.recipeData
                                                            ?.recipeProducts?[
                                                        index],
                                                  );
                                                },
                                              )
                                            : const SizedBox.shrink()),
                                        66.verticalSpace,
                                        Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.instructions),
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: AppColors.iconAndTextColor(),
                                            letterSpacing: -0.4,
                                          ),
                                        ),
                                        16.verticalSpace,
                                        (state.recipeData?.instructions != null
                                            ? ListView.builder(
                                                itemCount: state.recipeData
                                                    ?.instructions?.length,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return InstructionItem(
                                                    index: index,
                                                    instructions: state
                                                        .recipeData
                                                        ?.instructions?[index],
                                                  );
                                                },
                                              )
                                            : const SizedBox.shrink()),
                                        44.verticalSpace,
                                        Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.nutritionInfo),
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            color: AppColors.iconAndTextColor(),
                                            letterSpacing: -0.4,
                                          ),
                                        ),
                                        8.verticalSpace,
                                        (state.recipeData?.nutritions != null
                                            ? ListView.builder(
                                                itemCount: state.recipeData
                                                    ?.nutritions?.length,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return NutritionItem(
                                                    nutritions: state.recipeData
                                                        ?.nutritions?[index],
                                                  );
                                                },
                                              )
                                            : const SizedBox.shrink()),
                                        40.verticalSpace,
                                      ],
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 16.r,
            child: BlurWrap(
              radius: BorderRadius.circular(20.r),
              child: GestureDetector(
                onTap: context.popRoute,
                child: Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.06),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    FlutterRemix.arrow_left_s_line,
                    color: AppColors.white,
                    size: 24.r,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(recipeDetailsProvider);
          final notifier = ref.read(recipeDetailsProvider.notifier);
          return state.isLoading || state.recipeData == null
              ? const SizedBox.shrink()
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: ref.watch(ingredientsVisibleProvider).isVisible
                          ? ((state.recipeData?.recipeProducts?.length ?? 1) *
                                      108 +
                                  82)
                              .r
                          : 0,
                      margin: REdgeInsets.only(bottom: 100),
                      width: double.infinity,
                      padding: REdgeInsets.only(top: 38),
                      decoration: BoxDecoration(
                        color: AppColors.mainAppbarBack(),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, -2),
                            blurRadius: 30.r,
                            spreadRadius: 0,
                            color: AppColors.mainAppbarShadow(),
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        itemCount: state.recipeData?.recipeProducts?.length,
                        shrinkWrap: true,
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return RecipeProductItem(
                            product: state.recipeData?.recipeProducts?[index],
                            onIncrease: () {
                              notifier.increaseRecipeProductCount(index);
                            },
                            onDecrease: () {
                              notifier.decreaseRecipeProductCount(index);
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 100.r,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.mainAppbarBack(),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, -2),
                            blurRadius: 30.r,
                            spreadRadius: 0,
                            color: AppColors.mainAppbarShadow(),
                          ),
                        ],
                      ),
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: OpenIngredientsButton(
                              isVisible: ref
                                  .watch(ingredientsVisibleProvider)
                                  .isVisible,
                              onTap: () {
                                ref
                                    .read(ingredientsVisibleProvider.notifier)
                                    .toggleVisibility();
                              },
                            ),
                          ),
                          20.horizontalSpace,
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final addedState =
                                    ref.watch(ingredientsToCartProvider);
                                return CommonMaterialButton(
                                  height: 50,
                                  color: AppColors.green,
                                  text: addedState.added
                                      ? AppHelpers.getTranslation(TrKeys.added)
                                      : '${AppHelpers.getTranslation(TrKeys.add)} ${state.recipeData?.recipeProducts?.length} ${AppHelpers.getTranslation(TrKeys.itemsToCart)}',
                                  horizontalPadding: 0,
                                  isLoading: addedState.isLoading,
                                  onTap: addedState.added
                                      ? null
                                      : () {
                                          ref
                                              .read(ingredientsToCartProvider
                                                  .notifier)
                                              .insertProducts(
                                                shopId: widget.shopId,
                                                products: state
                                                    .recipeData?.recipeProducts,
                                                checkYourNetwork: () {
                                                  AppHelpers.showCheckFlash(
                                                    context,
                                                    AppHelpers.getTranslation(TrKeys
                                                        .checkYourNetworkConnection),
                                                  );
                                                },
                                                success: () {
                                                  AppHelpers.showCheckFlash(
                                                    context,
                                                    AppHelpers.getTranslation(
                                                        TrKeys
                                                            .successfullyAdded),
                                                  );
                                                  context.router
                                                      .pushAndPopUntil(
                                                          CartRoute(
                                                              shopId: widget
                                                                  .shopId),
                                                          predicate:
                                                              (Route<dynamic>
                                                                  route) {
                                                    context.router
                                                        .popUntilRouteWithName(
                                                            ShopMainRoute.name);
                                                    return true;
                                                  });
                                                },
                                              );
                                        },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
