import 'package:flutter/material.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class MTTextField extends StatefulWidget {
  final bool obscureText;
  final String hintText;
  final IconData iconData;
  final IconData prefixIcon;
  final bool border;
  final ValueChanged onChanged;
  final bool filled;
  final TextEditingController controller;

  MTTextField(
      {Key key,
      this.obscureText = false,
      this.hintText,
      this.iconData,
      this.prefixIcon,
      this.border = false,
      this.filled = true,
      this.onChanged,
      @required this.controller})
      : super(key: key);

  @override
  _MTTextFieldState createState() => _MTTextFieldState();
}

class _MTTextFieldState extends State<MTTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String text) => widget.onChanged(text),
      controller: widget.controller,
      obscureText: widget.obscureText,
      cursorColor: Color(MTColors.DEFAULT_TEXT),
      cursorWidth: S.w(8),
      cursorRadius: Radius.elliptical(2, 8),
      decoration: InputDecoration(
        border: widget.border
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.pink,
                ),
              )
            : InputBorder.none,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
        fillColor: Color(MTColors.LIGHT),
        filled: widget.filled,
        hintStyle: TextStyle(
          color: Color(0xFFADADAD),
          fontSize: MTConstant.MIN_SIZE,
        ),
        icon: widget.iconData == null ? null : Icon(widget.iconData),
      ),
    );
  }
}
