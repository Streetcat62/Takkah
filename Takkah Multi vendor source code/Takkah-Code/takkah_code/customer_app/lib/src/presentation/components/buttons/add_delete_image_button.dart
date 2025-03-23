import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class AddDeleteImageButton extends StatelessWidget {
  final ValueSetter<String>? onChangePhoto;
  final VoidCallback? onDeletePhoto;
  final String? path;

  const AddDeleteImageButton({
    Key? key,
    this.onChangePhoto,
    this.path,
    this.onDeletePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.r,
      width: 120.r,
      alignment: Alignment.center,
      margin: EdgeInsetsDirectional.only(end: 8.r),
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                width: 120.r,
                height: 120.r,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.05),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: path != null
                    ? Image.file(
                        File(path!),
                        width: 120.r,
                        height: 120.r,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
          ),
          Positioned(
            top: 98.r,
            left: 38.r,
            child: Material(
              color: path != null ? AppColors.red : AppColors.unratedIcon(),
              borderRadius: BorderRadius.circular(22.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(22.r),
                onTap: path != null
                    ? onDeletePhoto
                    : () async {
                        XFile? pickedFile;
                        try {
                          pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                        } catch (ex) {
                          debugPrint('===> trying to select image $ex');
                        }
                        if (pickedFile != null && onChangePhoto != null) {
                          onChangePhoto!(pickedFile.path);
                        }
                      },
                child: Container(
                  height: 44.r,
                  width: 44.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.r),
                    border: Border.all(
                      width: 3.r,
                      color: AppColors.white,
                    ),
                  ),
                  child: Icon(
                    path != null
                        ? FlutterRemix.delete_bin_fill
                        : FlutterRemix.add_fill,
                    color: AppColors.white,
                    size: 20.r,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
