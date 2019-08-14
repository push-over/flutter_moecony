import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class MTButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final double width;
  final double height;
  final Store store;
  final TextStyle textStyle;

  final MainAxisAlignment mainAxisAlignment;

  MTButton(
      {Key key,
      this.width,
      this.height,
      @required this.text,
      this.color,
      this.onTap,
      this.textStyle,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color != null ? color : store.state.themeData.primaryColor,
          borderRadius: BorderRadius.circular(
            S.w(10),
          ),
        ),
        child: Text(
          text,
          style: textStyle != null ? textStyle : MTConstant.MIN_WHITE_TEXT,
        ),
      ),
    );
  }
}
