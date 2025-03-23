import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import 'widgets/wallet_history_item.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import 'riverpod/provider/wallet_histories_provider.dart';

class WalletHistoriesPage extends ConsumerStatefulWidget {
  const WalletHistoriesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletHistoriesPage> createState() =>
      _WalletHistoriesPageState();
}

class _WalletHistoriesPageState extends ConsumerState<WalletHistoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(walletHistoriesProvider.notifier).fetchWalletHistories();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.walletHistories),
        onLeadingPressed: context.popRoute,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final walletState = ref.watch(walletHistoriesProvider);
            return walletState.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3.r,
                      color: AppColors.green,
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: walletState.wallets.length,
                    padding: REdgeInsets.symmetric(vertical: 30),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return WalletHistoryItem(
                        wallet: walletState.wallets[index],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
