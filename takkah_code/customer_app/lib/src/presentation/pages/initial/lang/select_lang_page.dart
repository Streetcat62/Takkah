import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../theme/theme.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../../core/constants/constants.dart';
import 'riverpod/provider/select_lang_provider.dart';
import '../../../../riverpod/provider/app_provider.dart';
import 'widgets/new_language_item_widget.dart';

class SelectLangPage extends ConsumerStatefulWidget {
  final bool isRequired;

  const SelectLangPage({Key? key, required this.isRequired}) : super(key: key);

  @override
  ConsumerState<SelectLangPage> createState() => _SelectLangPageState();
}

class _SelectLangPageState extends ConsumerState<SelectLangPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(selectLangProvider.notifier)
          .getLanguages(isRequired: widget.isRequired),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(selectLangProvider);
    final event = ref.read(selectLangProvider.notifier);
    return AbsorbPointer(
      absorbing: state.isLoading || state.isSaving,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor: AppColors.mainBackground(),
          extendBody: true,
          appBar: CommonAppBar(
            title: AppHelpers.getTranslation(TrKeys.selectLanguage),
            hasBack: !widget.isRequired,
            onLeadingPressed: context.popRoute,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 60,
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBack(),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    onChanged: event.onSearch,
                    cursorWidth: 1.r,
                    cursorColor: AppColors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:
                          AppHelpers.getTranslation(TrKeys.searchLanguage),
                      prefixIcon: Icon(
                        FlutterRemix.search_2_line,
                        size: 20.sp,
                        color: AppColors.secondaryIconTextColor(),
                      ),
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        letterSpacing: -0.5,
                        color: AppColors.secondaryIconTextColor(),
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                state.isLoading
                    ? const HorizontalAnimatedShimmerList(
                        horizontalPadding: 16,
                        itemCount: 5,
                      )
                    : AnimationLimiter(
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: state.languages.length,
                          padding: REdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) {
                            final language = state.languages[index];
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: NewLanguageItemWidget(
                                    language: language,
                                    isChecked: state.selectedLanguage?.id ==
                                        language.id,
                                    onPress: () =>
                                        event.setSelectedLanguage(language),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: REdgeInsets.only(bottom: 30, left: 16, right: 16),
            child: MainConfirmButton(
              title: AppHelpers.getTranslation(TrKeys.save),
              isLoading: state.isSaving,
              onTap: () {
                if (widget.isRequired) {
                  event.makeSelectedLang(
                    context,
                    widget.isRequired,
                    afterUpdating: () => ref
                        .read(appProvider.notifier)
                        .changeLocale(state.selectedLanguage),
                  );
                } else {
                  event.changeLang(
                    context,
                    afterUpdating: () => ref
                        .read(appProvider.notifier)
                        .changeLocale(state.selectedLanguage),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
