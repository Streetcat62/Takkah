import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';

class SelectShopImagesButton extends StatelessWidget {
  final ValueSetter<String> onChangePhoto;
  final String path;
  final String title;

  const SelectShopImagesButton({
    Key? key,
    required this.onChangePhoto,
    required this.title,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      color: AppColors.mainAppbarBack(),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: () async {
          final XFile? pickedFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            debugPrint('===> set file ${pickedFile.path}');
            onChangePhoto(pickedFile.path);
          }
        },
        child: Container(
          height: 130.r,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.r,
              color: AppColors.secondaryBack(),
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          alignment: Alignment.center,
          child: path.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.file(
                    File(path),
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FlutterRemix.upload_cloud_2_line,
                      size: 26.r,
                      color: AppColors.iconAndTextColor(),
                    ),
                    8.verticalSpace,
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        letterSpacing: -14 * 0.01,
                        color: AppColors.iconAndTextColor(),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
