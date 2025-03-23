import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../application/order/shipping/address/order/order_address_provider.dart';
import '../../../../../styles/style.dart';

class AddressItem extends ConsumerWidget {
  final bool isSelected;
  final Function() onTap;
  final int index;
  const AddressItem(
    this.index, {
    Key? key,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressState = ref.read(orderAddressProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 74.r,
        margin: REdgeInsets.only(bottom: 8),
        padding: REdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color:
              isSelected ? Style.primaryColor.withOpacity(0.06) : Style.white,
          borderRadius: isSelected ? null : BorderRadius.circular(10.r),
          border: isSelected
              ? Border(
                  left: BorderSide(color: Style.primaryColor, width: 1.r),
                )
              : null,
        ),
        child: Row(
          children: [
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${addressState.user?.addresses?[index].title}',
                    style: Style.interSemi(size: 15.sp),
                  ),
                  4.verticalSpace,
                  Text(
                    '${addressState.user?.addresses?[index].address}',
                    style: Style.interNormal(size: 12.sp),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
