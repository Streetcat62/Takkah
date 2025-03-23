
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles/style.dart';

class FoodBrandsItem extends StatelessWidget {
  final String? brand;
  final String? category;
  final Function() onTap;
  final bool isSelected;
  final bool isBrand;

  const FoodBrandsItem({
    Key? key,
    this.category,
    this.brand,
    required this.onTap,
    required this.isSelected,
    required this.isBrand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: REdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 18.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                      color:
                          isSelected ? Style.primaryColor : Style.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Style.blackColor : Style.textColor,
                        width: isSelected ? 4 : 2,
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  Text(
                    isBrand ? brand ?? '' : category ?? '',
                    style: Style.interRegular(
                      size: 15.sp,
                      color: Style.blackColor,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
