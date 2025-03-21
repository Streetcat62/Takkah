import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import 'riverpod/provider/all_recipes_provider.dart';
import '../../../../../../core/constants/constants.dart';

class RecipesPage extends ConsumerStatefulWidget {
  final int? shopId;

  const RecipesPage({Key? key, this.shopId}) : super(key: key);

  @override
  ConsumerState<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends ConsumerState<RecipesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(allRecipesProvider.notifier).fetchRecipes(
          shopID: widget.shopId ?? 0,
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
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.recipes),
        onLeadingPressed: context.popRoute,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(allRecipesProvider);
            return GridRecipesBody(
              isLoading: state.isLoading,
              recipes: state.recipes,
              shopId: widget.shopId,
            );
          },
        ),
      ),
    );
  }
}
