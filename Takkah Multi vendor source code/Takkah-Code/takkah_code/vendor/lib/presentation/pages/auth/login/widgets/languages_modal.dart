import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../styles/style.dart';
import '../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/models/models.dart';
import '../../../../../../infrastructure/services/services.dart';

class LanguagesModal extends ConsumerWidget {
  final Function(LanguageData?)? afterUpdate;

  const LanguagesModal({Key? key, this.afterUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLtr = LocalStorage.instance.getLangLtr();
    final event = ref.read(languagesProvider.notifier);
    final state = ref.watch(languagesProvider);
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDisable(
        child: ModalWrap(
          body: state.isLoading
              ? Padding(
                  padding: REdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Platform.isAndroid
                        ? CircularProgressIndicator(
                            color: Style.greenColor,
                            strokeWidth: 5.r,
                          )
                        : const CupertinoActivityIndicator(radius: 12),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ModalDrag(),
                      TitleAndIcon(
                        title: AppHelpers.trans(TrKeys.language),
                        titleSize: 18,
                      ),
                      24.verticalSpace,
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.languages.length,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SelectItem(
                            onTap: () {
                              event.change(index);
                            },
                            isActive: state.index == index,
                            title: state.languages[index].title ?? '',
                          );
                        },
                      ),
                      18.verticalSpace,
                      CustomButton(
                        title: AppHelpers.trans(TrKeys.save),
                        onPressed: () {
                          ref
                              .read(languagesProvider.notifier)
                              .makeSelectedLang(afterUpdate: afterUpdate);
                          Navigator.pop(context);
                        },
                      ),
                      24.verticalSpace,
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
