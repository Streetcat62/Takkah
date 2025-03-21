import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/user_item.dart';
import 'widgets/create_user_modal.dart';
import '../../../../../styles/style.dart';
import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class SelectUserPage extends ConsumerStatefulWidget {
  const SelectUserPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SelectUserPage> createState() => _SelectUserPageState();
}

class _SelectUserPageState extends ConsumerState<SelectUserPage> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(orderUserProvider.notifier)
          .initialFetchUsers(refreshController: _refreshController),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        backgroundColor: Style.greyColor,
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(orderUserProvider);
            final event = ref.read(orderUserProvider.notifier);
            return Column(
              children: [
                CustomAppBar(
                  bottomPadding: 4.h,
                  child: SearchTextField(
                    onChanged: (value) => event.setQuery(
                      refreshController: _refreshController,
                      text: value,
                    ),
                  ),
                ),
                state.isLoading
                    ? const Expanded(
                        child: LoadingList(
                          horizontalPadding: 16,
                          itemCount: 10,
                          verticalPadding: 8,
                          itemPadding: 16,
                          itemHeight: 74,
                          itemBorderRadius: 10,
                        ),
                      )
                    : Expanded(
                        child: SmartRefresher(
                          controller: _refreshController,
                          enablePullUp: true,
                          onRefresh: () => event.refreshUsers(
                            refreshController: _refreshController,
                          ),
                          onLoading: () => event.fetchMoreUsers(
                            refreshController: _refreshController,
                          ),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.users.length,
                            shrinkWrap: true,
                            padding: REdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 20,
                              bottom: 80,
                            ),
                            itemBuilder: (context, index) => UserItem(
                              user: state.users[index],
                              isSelected: index == state.selectedIndex,
                              onTap: () {
                                event.setSelectedUser(index);
                                ref
                                    .read(orderAddressProvider)
                                    .textController!
                                    .clear();

                                context.popRoute();
                              },
                            ),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: REdgeInsets.all(16),
          child: Row(
            children: [
              const PopButton(heroTag: AppConstants.heroTagAddOrderButton),
              8.horizontalSpace,
              Expanded(
                child: CustomButton(
                  title: AppHelpers.trans(TrKeys.addUser),
                  onPressed: () => AppHelpers.showCustomModalBottomSheet(
                    context: context,
                    modal: const CreateUserModal(),
                    isDarkMode: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
