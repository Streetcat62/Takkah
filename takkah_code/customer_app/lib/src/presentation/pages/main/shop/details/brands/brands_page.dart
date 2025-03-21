import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import 'riverpod/provider/brands_provider.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import 'riverpod/provider/search_brand_provider.dart';
import '../../../../../../core/constants/constants.dart';

class BrandsPage extends ConsumerStatefulWidget {
  final int? shopId;

  const BrandsPage({Key? key, this.shopId}) : super(key: key);

  @override
  ConsumerState<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends ConsumerState<BrandsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(brandsProvider.notifier).updateBrands(context);
        ref.watch(searchBrandProvider.notifier).makeAllBrand();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.brands),
        onLeadingPressed: context.popRoute,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(searchBrandProvider);
          final notifier = ref.watch(searchBrandProvider.notifier);
          return Column(
            children: [
              SearchTextField(
                hintText: AppHelpers.getTranslation(TrKeys.searchBrands),
                onChanged: (query) => notifier.setQuery(context, query),
              ),
              Expanded(
                child: state.isSearching
                    ? SearchBrandsBody(
                        isSearchLoading: state.isSearchLoading,
                        searchedBrands: state.searchedBrands,
                        shopId: widget.shopId,
                      )
                    : Padding(
                        padding: REdgeInsets.symmetric(horizontal: 16.0),
                        child: Consumer(
                          builder: (context, ref, child) {
                            final brandsState = ref.watch(brandsProvider);
                            return brandsState.isLoading
                                ? const CupertinoActivityIndicator(radius: 20)
                                : GridView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    padding:
                                        REdgeInsets.symmetric(vertical: 30),
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: brandsState.brands.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 120 / 120,
                                      mainAxisSpacing: 12.r,
                                      crossAxisSpacing: 12,
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder: (context, index) => BrandItem(
                                      brand: brandsState.brands[index],
                                    ),
                                  );
                          },
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
