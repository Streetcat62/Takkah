import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'foods/foods_body.dart';

import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';

class FoodsPage extends ConsumerStatefulWidget {
  const FoodsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends ConsumerState<FoodsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late RefreshController _categoryController;
  late RefreshController _productController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _categoryController = RefreshController();
    _productController = RefreshController();

    _scrollController.addListener(
      () {
        final direction = _scrollController.position.userScrollDirection;
        if (direction == ScrollDirection.reverse) {
          ref.read(mainProvider.notifier).changeScrolling(true);
        } else {
          ref.read(mainProvider.notifier).changeScrolling(false);
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(foodCategoriesProvider.notifier).initialFetchCategories();
        ref.read(foodsProvider.notifier).initialFetchFoods();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollController.dispose();
    _categoryController.dispose();
    _productController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        backgroundColor: Style.greyColor,
        body: Column(
          children: [
            CustomAppBar(
              bottomPadding: 4.h,
              child: Consumer(
                builder: (context, ref, child) {
                  final foodsEvent = ref.read(foodsProvider.notifier);
                  final categoriesState = ref.watch(foodCategoriesProvider);
                  return SearchTextField(
                    onChanged: (value) => foodsEvent.setQuery(
                      query: value,
                      categoryId: categoriesState.activeIndex == 1
                          ? null
                          : categoriesState
                              .category[categoriesState.activeIndex - 2].id,
                    ),
                    suffixIcon: ButtonsBouncingEffect(
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          FlutterRemix.equalizer_fill,
                          color: Style.blackColor,
                          size: 20.r,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: FoodsBody(
                scrollController: _scrollController,
                categoryController: _categoryController,
                productController: _productController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
