import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/utils.dart';

class CustomTextInput extends StatefulWidget {
  final String? title;
  final String? placeholder;
  final String? defaultValue;
  final ValueSetter<String>? onChange;
  final TextInputType? type;
  final bool? isFull;

  const CustomTextInput({
    Key? key,
    this.title,
    this.placeholder,
    this.defaultValue,
    this.onChange,
    this.type,
    this.isFull,
  }) : super(key: key);

  @override
  State<CustomTextInput> createState() => _TextInputState();
}

class _TextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext build) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      margin: EdgeInsets.only(top: 0.023.sh),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${widget.title}',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: isDarkMode
                  ? const Color.fromRGBO(255, 255, 255, 1)
                  : const Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          SizedBox(
            width: (widget.isFull ?? false) ? 1.sw : 0.845.sw,
            child: TextField(
              controller: TextEditingController(text: widget.defaultValue)
                ..selection = TextSelection.fromPosition(
                  TextPosition(offset: (widget.defaultValue ?? '').length),
                ),
              onChanged: widget.onChange,
              keyboardType: widget.type,
              textCapitalization: TextCapitalization.sentences,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: isDarkMode
                    ? const Color.fromRGBO(255, 255, 255, 1)
                    : const Color.fromRGBO(0, 0, 0, 1),
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: isDarkMode
                        ? const Color.fromRGBO(130, 139, 150, 1)
                        : const Color.fromRGBO(136, 136, 126, 0.26)),
                hintText: widget.placeholder,
              ),
            ),
          )
        ],
      ),
    );
  }
}
