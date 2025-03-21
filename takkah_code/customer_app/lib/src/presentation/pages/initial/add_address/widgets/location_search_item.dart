import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';

class LocationSearchItem extends StatelessWidget {
  final bool? isLast;
  final String? mainText;
  final String? address;
  final ValueSetter<String>? onClickIcon;
  final ValueSetter<String>? onClickRaw;

  const LocationSearchItem({
    Key? key,
    this.isLast,
    this.mainText,
    this.address,
    this.onClickIcon,
    this.onClickRaw,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 1.sw - 70,
      decoration: BoxDecoration(
        border: isLast!
            ? null
            : Border(
                bottom: BorderSide(
                  width: 1.r,
                  color: AppColors.secondaryIconTextColor(),
                ),
              ),
      ),
      child: Row(
        children: <Widget>[
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.zero,
              ),
            ),
            onPressed: () => onClickRaw!(mainText!),
            child: SizedBox(
              width: 1.sw - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$mainText',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      letterSpacing: -0.4,
                      color: AppColors.iconAndTextColor(),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(maxWidth: 1.sw - 150),
                        child: Text(
                          '$address',
                          softWrap: true,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            letterSpacing: -0.4,
                            color: AppColors.secondaryIconTextColor(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 13.r,
                        child: Icon(
                          const IconData(0xeb7c, fontFamily: 'MIcon'),
                          color: AppColors.secondaryIconTextColor(),
                          size: 5.r,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => onClickIcon!(mainText!),
            child: Icon(
              FlutterRemix.user_location_fill,
              color: AppColors.secondaryIconTextColor(),
              size: 24.r,
            ),
          )
        ],
      ),
    );
  }
}
