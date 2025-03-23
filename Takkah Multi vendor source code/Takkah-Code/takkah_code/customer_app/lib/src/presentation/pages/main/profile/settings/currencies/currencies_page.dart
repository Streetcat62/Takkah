import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import 'widget/currency_item_widget.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import 'riverpod/provider/currencies_provider.dart';
import '../../../../../../core/constants/constants.dart';

class CurrenciesPage extends ConsumerStatefulWidget {
  const CurrenciesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CurrenciesPage> createState() => _CurrenciesPageState();
}

class _CurrenciesPageState extends ConsumerState<CurrenciesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(currenciesProvider.notifier).getCurrencies(
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
    final state = ref.watch(currenciesProvider);
    final notifier = ref.read(currenciesProvider.notifier);
    return AbsorbPointer(
      absorbing: state.isLoading || state.isSaving,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor: AppColors.mainBackground(),
          appBar: CommonAppBar(
            title: AppHelpers.getTranslation(TrKeys.currencies),
            onLeadingPressed: context.popRoute,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    20.verticalSpace,
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16.0),
                      child: state.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 3.r,
                                color: AppColors.green,
                              ),
                            )
                          : Column(
                              children: state.currencies.map(
                                (item) {
                                  return CurrencyItemWidget(
                                    isChecked:
                                        state.selectedCurrency?.id == item.id,
                                    text: '${item.title} - (${item.symbol})',
                                    onPress: () =>
                                        notifier.setSelectedCurrency(item),
                                  );
                                },
                              ).toList(),
                            ),
                    ),
                  ],
                ),
              ),
              BlurLoadingWidget(isLoading: state.isSaving),
            ],
          ),
          extendBody: true,
          bottomNavigationBar: Padding(
            padding: REdgeInsets.only(bottom: 15, left: 15, right: 15),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.zero),
              ),
              onPressed: () {
                notifier.changeCurrency(
                  afterUpdating: () {
                    context.popRoute();
                  },
                  checkYourNetwork: () {
                    AppHelpers.showCheckFlash(
                      context,
                      AppHelpers.getTranslation(
                          TrKeys.checkYourNetworkConnection),
                    );
                  },
                );
              },
              child: Container(
                width: 1.sw - 30,
                height: 60.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  AppHelpers.getTranslation(TrKeys.next),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
