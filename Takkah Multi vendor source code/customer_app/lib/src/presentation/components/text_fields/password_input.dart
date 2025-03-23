import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/utils.dart';

class PasswordInput extends StatefulWidget {
  final String? title;
  final ValueSetter<String>? onChange;

  const PasswordInput({Key? key, this.title, this.onChange}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext build) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      margin: REdgeInsets.only(top: 0.023.sh),
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
            width: 0.845.sw,
            child: TextField(
              onChanged: widget.onChange,
              textAlignVertical: TextAlignVertical.center,
              obscureText: isObscureText,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  icon: Icon(
                    isObscureText
                        ? FlutterRemix.eye_line
                        : FlutterRemix.eye_close_line,
                    color: isDarkMode
                        ? const Color.fromRGBO(255, 255, 255, 1)
                        : const Color.fromRGBO(0, 0, 0, 1),
                    size: 20.sp,
                  ),
                ),
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: isDarkMode
                        ? const Color.fromRGBO(130, 139, 150, 0.26)
                        : const Color.fromRGBO(136, 136, 126, 0.26)),
                hintText: ' * * * * * * * * * ',
              ),
            ),
          )
        ],
      ),
    );
  }
}
