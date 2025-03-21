import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components.dart';
import '../../styles/style.dart';
import '../../../infrastructure/services/services.dart';

class HorizontalImagePicker extends StatelessWidget {
  final String? imageFilePath;
  final String? imageUrl;
  final Function(String) onImageChange;
  final Function() onDelete;
  final bool isAdding;

  const HorizontalImagePicker({
    Key? key,
    required this.onImageChange,
    required this.onDelete,
    this.imageFilePath,
    this.imageUrl,
    this.isAdding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: (isAdding && imageFilePath == null)
          ? InkWell(
              onTap: () async {
                XFile? file;
                try {
                  file = await ImagePicker()
                      .pickImage(
                      source:
                      ImageSource.gallery);
                } catch (ex) {
                  debugPrint(
                      '===> trying to select image $ex');
                }
                if (file != null) {
                  onImageChange(file.path);
                }
              },
              child: Container(
                width: double.infinity,
                height: 180.h,
                decoration: BoxDecoration(
                  color: Style.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: REdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        XFile? file;
                        try {
                          file = await ImagePicker()
                              .pickImage(
                              source:
                              ImageSource.gallery);
                        } catch (ex) {
                          debugPrint(
                              '===> trying to select image $ex');
                        }
                        if (file != null) {
                          onImageChange(file.path);
                        }
                      },
                      child: Icon(
                        FlutterRemix.upload_cloud_2_line,
                        color: Style.primaryColor,
                        size: 36.r,
                      ),
                    ),
                    16.verticalSpace,
                    Text(
                      AppHelpers.trans(TrKeys.productPicture),
                      style: Style.interSemi(
                        size: 14,
                        color: Style.blackColor,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      AppHelpers.trans(TrKeys.recommendedSize),
                      style: Style.interRegular(
                        size: 14,
                        color: Style.blackColor,
                        letterSpacing: -0.3,
                      ),
                    )
                  ],
                ),
              ),
            )
          : Stack(
              children: [
                SizedBox(
                  height: 180.h,
                  width: double.infinity,
                  child: imageFilePath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.file(
                            File(imageFilePath!),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      : CommonImage(
                          imageUrl: imageUrl,
                          width: double.infinity,
                          radius: 16,
                          fit: BoxFit.cover,
                        ),
                ),
                Positioned(
                  top: 12.h,
                  right: 16.w,
                  child: Row(
                    children: [
                      ButtonsBouncingEffect(
                        child: GestureDetector(
                          onTap: () async {
                            XFile? file;
                            try {
                              file = await ImagePicker()
                                  .pickImage(
                                  source:
                                  ImageSource.gallery);
                            } catch (ex) {
                              debugPrint(
                                  '===> trying to select image $ex');
                            }
                            if (file != null) {
                              onImageChange(file.path);
                            }
                          },
                          child: BlurWrap(
                            radius: BorderRadius.circular(18.r),
                            child: Container(
                              height: 36.r,
                              width: 36.r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Style.white.withOpacity(0.15),
                              ),
                              child: Icon(
                                FlutterRemix.image_add_fill,
                                color: (!isAdding &&
                                        imageUrl == null &&
                                        imageFilePath == null)
                                    ? Style.blackColor
                                    : Style.white,
                                size: 18.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      if (imageFilePath != null)
                        ButtonsBouncingEffect(
                          child: GestureDetector(
                            onTap: onDelete,
                            child: BlurWrap(
                              radius: BorderRadius.circular(20.r),
                              child: Container(
                                height: 36.r,
                                width: 36.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Style.white.withOpacity(0.15),
                                ),
                                child: Icon(
                                  FlutterRemix.delete_bin_fill,
                                  color: Style.white,
                                  size: 18.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
