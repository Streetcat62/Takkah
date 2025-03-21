import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../../core/constants/constants.dart';

class UserAddressAppBar extends StatelessWidget {
  final double height;
  final double searchHeight;
  final String? address;
  final VoidCallback onChangeTap;
  final ValueSetter<String> onTextFieldChange;

  const UserAddressAppBar({
    Key? key,
    required this.height,
    required this.searchHeight,
    required this.onChangeTap,
    required this.onTextFieldChange,
    this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.mainAppbarBack(),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 2.r,
                spreadRadius: 0,
                color: AppColors.mainAppbarShadow(),
              ),
            ],
          ),
          alignment: Alignment.bottomCenter,
          padding: REdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 34.r,
                      width: 34.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.r),
                        color: AppColors.green,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        FlutterRemix.map_pin_2_fill,
                        color: AppColors.white,
                        size: 16.r,
                      ),
                    ),
                    8.horizontalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.deliveryAddress),
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.iconAndTextColor(),
                            letterSpacing: -0.5,
                          ),
                        ),
                        2.verticalSpace,
                        Text(
                          '$address',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            color: AppColors.secondaryIconTextColor(),
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(100.r),
                color: AppColors.black,
                child: InkWell(
                  borderRadius: BorderRadius.circular(100.r),
                  onTap: onChangeTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    alignment: Alignment.center,
                    height: 30.r,
                    padding: REdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.change),
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SearchTextField(
          hintText: AppHelpers.getTranslation(TrKeys.search),
          onChanged: onTextFieldChange,
        ),
      ],
    );
  }
}
