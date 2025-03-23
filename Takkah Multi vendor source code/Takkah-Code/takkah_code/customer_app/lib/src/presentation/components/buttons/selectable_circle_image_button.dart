import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_image.dart';
import '../../theme/theme.dart';

class SelectableCircleImageButton extends StatelessWidget {
  final String? path;
  final String? imageUrl;
  final int width;

  const SelectableCircleImageButton({
    Key? key,
    this.path,
    this.imageUrl,
    this.width = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular((width / 2).r),
      child: Container(
        width: width.r,
        height: width.r,
        decoration: BoxDecoration(
          color: AppColors.gray.withOpacity(0.21),
          shape: BoxShape.circle,
        ),
        child: imageUrl != null
            ? CommonImage(
                imageUrl: imageUrl,
                width: width.toDouble(),
                height: width.toDouble(),
                radius: (width / 2).toDouble(),
              )
            : path != null
                ? Image.file(
                    File(path!),
                    width: 120.r,
                    height: 120.r,
                    fit: BoxFit.cover,
                  )
                : null,
      ),
    );
  }
}
